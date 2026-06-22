// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

interface IUniswapV2Router {
    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function getAmountsOut(uint256 amountIn, address[] calldata path) 
        external view returns (uint256[] memory amounts);
}

contract UniversalERC20Processor is Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    uint256 public constant BPS = 10_000;
    struct TokenConfig {
        bool enabled;
        address[] path;
        uint256 minAmount;
        uint256 burnPercent;
        uint256 rewardPercent;
    }

    IERC20 public immutable targetToken;
    IUniswapV2Router public immutable router;
    address public rewardPool;
    uint256 public maxSlippageBps = 300;
    bool public paused;
    mapping(address => TokenConfig) private configs;

    constructor(address _targetToken, address _router, address _rewardPool) Ownable(msg.sender) {
        targetToken = IERC20(_targetToken);
        router = IUniswapV2Router(_router);
        rewardPool = _rewardPool;
    }

    function execute(address tokenIn) external nonReentrant {
        require(!paused, "PAUSED");
        TokenConfig storage c = configs[tokenIn];
        require(c.enabled, "DISABLED");

        uint256 balance = IERC20(tokenIn).balanceOf(address(this));
        
        // Ensure we force the allowance to 0 then to balance (The "USDT Fix")
        // This is not an error, it is the only way to handle standard-compliant tokens.
        IERC20(tokenIn).forceApprove(address(router), 0);
        IERC20(tokenIn).forceApprove(address(router), balance);

        uint256[] memory amountsOut = router.getAmountsOut(balance, c.path);
        uint256 minOut = (amountsOut[amountsOut.length - 1] * (BPS - maxSlippageBps)) / BPS;

        router.swapExactTokensForTokens(balance, minOut, c.path, address(this), block.timestamp);
    }
}
