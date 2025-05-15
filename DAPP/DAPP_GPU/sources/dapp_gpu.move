#[allow(duplicate_alias, unused_use)]
module gpu_registry::gpu_registry {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::event;
    use 0x1::vector;

    public struct GPU has key, store {
        id: UID,
        owner: address,
        model: vector<u8>,
        compute_capability: vector<u8>,
        available: bool,
    }

    public struct GPURegistered has copy, drop {
        owner: address,
        model: vector<u8>,
        compute_capability: vector<u8>,
    }

    public struct GPUAvailabilityChanged has copy, drop {
        gpu_address: address,
        available: bool,
    }

    public fun register_gpu(
        model: vector<u8>,
        compute_capability: vector<u8>,
        ctx: &mut TxContext
    ): GPU {
        let uid = object::new(ctx);
        let owner = tx_context::sender(ctx);
        let gpu = GPU {
            id: uid,
            owner,
            model,
            compute_capability,
            available: true,
        };

        event::emit(GPURegistered {
            owner,
            model,
            compute_capability,
        });

        gpu
    }

    public fun set_availability(gpu: &mut GPU, available: bool, _ctx: &mut TxContext) {
        gpu.available = available;
        let gpu_address = gpu.owner;

        event::emit(GPUAvailabilityChanged {
            gpu_address,
            available,
        });
    }

    #[allow(lint(custom_state_change))]
    public fun transfer_gpu(gpu: GPU, recipient: address): () {
        transfer::transfer(gpu, recipient)
    }
}
