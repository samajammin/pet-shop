pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;
    
    event AdoptedPet(address indexed _adopter, uint indexed _petId);

    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15, "Pet ID is out of range.");
        require(adopters[petId] == address(0), "This pet has already been adopted.");
        adopters[petId] = msg.sender;
        emit AdoptedPet(msg.sender, petId);
        return petId;
    }

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}