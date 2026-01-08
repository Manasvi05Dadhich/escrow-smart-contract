// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

contract Escrow {
    address public buyer;
    address public seller;
    uint256 public amount;

    enum State {
        AWAITING_PAYMENT,
        AWAITING_DELIVERY,
        COMPLETE,
        REFUNDED
    }

    State public currentState;

    constructor(address _seller) {
        buyer = msg.sender;
        seller = _seller;
        currentState = State.AWAITING_PAYMENT;
    }

    function deposit() external payable {
        require(msg.sender == buyer, "Not buyer");
        require(currentState == State.AWAITING_PAYMENT, "Wrong state");
        require(msg.value > 0, "Invalid amount");

        amount = msg.value;
        currentState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() external {
        require(msg.sender == buyer, "Not buyer");
        require(currentState == State.AWAITING_DELIVERY, "Wrong state");

        currentState = State.COMPLETE;

        (bool success, ) = seller.call{value: amount}("");
        require(success, "Payment failed");
    }

    function refundBuyer() external {
        require(msg.sender == seller, "Not seller");
        require(currentState == State.AWAITING_DELIVERY, "Wrong state");

        currentState = State.REFUNDED;

        (bool success, ) = buyer.call{value: amount}("");
        require(success, "Refund failed");
    }
}
