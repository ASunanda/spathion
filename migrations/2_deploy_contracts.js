const InvoiceNFT = artifacts.require("InvoiceNFT");

const InvoicePool = artifacts.require("InvoicePool");

const USDT = artifacts.require("USDT");

const LendingPool = artifacts.require("LendingPool");


module.exports = async function (deployer) {

  await deployer.deploy(InvoiceNFT);

  const invoicenft = InvoiceNFT.address;

  await deployer.deploy(InvoicePool,invoicenft);

  await deployer.deploy(USDT);

  const usdt = USDT.address;

  await deployer.deploy(LendingPool,usdt);

  };
