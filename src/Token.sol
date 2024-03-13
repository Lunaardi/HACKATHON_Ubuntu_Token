// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Cria um Token
contract Token {

//Define um nome, simbolo e casas decimais do token que será publicos essas informações
	string public name;
	string public symbol;
	uint8 public decimal;
	uint256 public totalSupply;
	
	event Transfer(address from, address _to, uint256 amount);
	event Approval(address _owner, address _to, uint256 amount);
	
	mapping(address => uint256) balances;
	
	// | key							| valor
	// | key							| valor
	
	mapping(address => mapping(address => uint256)) allowances;
	
	function balanceOf(address _owner) public view returns (uint256) {
		uint256 balanceOfUser = balances[_owner];
		return balanceOfUser;
	}
	
	function transfer(address _to, uint256 _value) public returns (bool) {
		require(balances[msg.sender] >= _value, "INSULFICIENTE_AMOUNT");
		
		balances[_to] += _value;
		balances[msg.sender] -= _value;
		
		emit Transfer(msg.sender, _to, _value);
		return true;
	}
	
	function approve(address _spender, uint256 amount) public {
		allowances[msg.sender][_spender] = amount;
		//Approval(_owner, _to,  amount);
		emit Approval(msg.sender, _spender, amount);
	}
	
	function transferFrom(address _from, address _to, uint256 _value) public {
		require(allowances[_from][msg.sender] >= _value, "INSUFFICIENT_ALLOWANCE");
		
		balances[_from] -= _value;
		balances[_to] += _value;
	
		emit Transfer(_from, _to, _value);
	}
	
	function allowance(address _owner, address _spender) public view returns (uint256) {
		return allowances[_spender] [_owner];
	}
	
	constructor() {
		name = "Analysis Cript Hash";
		symbol = "ACH";
		decimal = 18;
		
		totalSupply == 10000 * 10e18;
		balances[msg.sender] = totalSupply;
		
	}
}	

