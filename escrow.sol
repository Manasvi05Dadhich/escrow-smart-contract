// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

contract Escrow {
    address public seller;
    address public buyer;

    uint256 public amount;

    enum State{
        pending_payment, pending_delivery, payment_done, refund
    }
}

