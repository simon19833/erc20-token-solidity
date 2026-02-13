pragma solidity ^0.8.20;
contract MyToken{

    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;

    uint256 public totalSupply;
    mapping (address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256) ) public allowance;

    event Transfer (address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

      constructor(uint256 initialSupply) {
        _mint(msg.sender, initialSupply);
    }


function transfer(address to, uint256 value) external returns (bool){
    require(to != address(0), "ZERO_ADDR");
    require(balanceOf[msg.sender] >= value, "NO_BAL");
        
    balanceOf[msg.sender] -= value;
    balanceOf[to] += value;

    emit Transfer (msg.sender, to, value);
    return true;
    }
    
 function approve (address spender, uint256 value) external returns (bool){
    require (spender != address(0), "ZERO_ADDR");

    allowance [msg.sender][spender] = value;
    emit Approval (msg.sender, spender ,value);
    return true;
    }

 function transferFrom(address from, address to, uint256 value) external returns (bool){
    require (to != address(0), "ZERO_ADDR");
    require(balanceOf [from] >= value, "NO_BAL");

    uint256 allowed = allowance[from][msg.sender];
    require (allowed >= value, "NO_ALLOW");

    allowance[from][msg.sender] =allowed - value;
    balanceOf[from] -= value;
    balanceOf[to] += value;

    emit Transfer(from, to, value);
    return true;
           }

function _mint(address to, uint256 value) internal{
        require (to != address(0), "ZERO_ADDR");
        totalSupply += value;
        balanceOf[to] += value;

        emit Transfer(address(0), to, value);
            }
}
           
    
