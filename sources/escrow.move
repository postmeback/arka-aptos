module escrow_program::escrowContract {
     use std::signer;
    use std::coin::{transfer, Coin};
    use std::account;

    struct Escrow has key {
        seller: address,
        buyer: address,
        amount: u64,
        is_completed: bool,
    }

    public fun create_escrow<CoinType>(
        account: &signer,
        seller: address,
        buyer: address,
        amount: u64,
    ) {
        // let sender_address = signer::address_of(account);

        // Transfer the amount from sender to the escrow
        transfer<CoinType>(account, seller, amount);

        // Create the Escrow struct
        let escrow = Escrow {
            seller,
            buyer,
            amount,
            is_completed: false,
        };

        // Save the Escrow struct under the sender's address
        move_to(account, escrow);
    }

    public fun release_funds<CoinType>(account: &signer) acquires Escrow {
        let sender_address = signer::address_of(account);
        let escrow = borrow_global_mut<Escrow>(sender_address);
        assert!(!escrow.is_completed, 1);

        // Transfer the amount from escrow to the seller
        transfer<CoinType>(account, escrow.seller, escrow.amount);

        // Mark the escrow as completed
        escrow.is_completed = true;
    }

    public fun cancel_escrow<CoinType>(account: &signer) acquires Escrow {
        let sender_address = signer::address_of(account);
        let escrow = borrow_global_mut<Escrow>(sender_address);
        assert!(!escrow.is_completed, 1);

        // Transfer the amount back to the buyer
        transfer<CoinType>(account, escrow.buyer, escrow.amount);

        // Mark the escrow as completed
        escrow.is_completed = true;
    }
}
