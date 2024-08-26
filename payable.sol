//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract recieveth{
    receive() external payable{}
    fallback() external payable{}

    function getbal() public view returns(uint){
        return address(this).balance;
    }

}

contract sendeth{

    function viatransfer(address payable to) public payable{
        to.transfer(msg.value);
    }

    function viacall(address payable to) payable public {
       (bool success, bytes memory data) = to.call{value:msg.value}("hi");
        require(success, "no success");
    }
}
