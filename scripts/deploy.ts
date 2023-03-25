const { ethers } = require('hardhat')


async function main() {
    const [owner] = await ethers.getSigners();
    // deploy DiamondCutFacet
  const DiamondCutFacet = await ethers.getContractFactory('DiamondCutFacet');
  const diamondCutFacet = await DiamondCutFacet.deploy();
  await diamondCutFacet.deployed();
  console.log('DiamondCutFacet deployed:', diamondCutFacet.address);

  // deploy Diamond
  const Diamond = await ethers.getContractFactory('Diamond');
  const diamond = await Diamond.deploy(owner.address, diamondCutFacet.address,);
  await diamond.deployed();
  console.log('Diamond deployed:', diamond.address);

  
  // deploy facets
console.log('"""""""""""""""""""""""""""""""""""""""');
  console.log('Deploying facets');



















}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });