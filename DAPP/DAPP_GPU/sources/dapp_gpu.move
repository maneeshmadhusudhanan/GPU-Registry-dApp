
module 0x0::gpu_registry {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::TxContext;
    use sui::event;
    use 0x1::vector;

    public struct GPU has key, store {
        id: UID,
        owner: address,
        model: vector<u8>,                // string replaced by vector<u8>
        compute_capability: vector<u8>,  // string replaced by vector<u8>
        available: bool,
    }

    public struct GPURegistered has copy, drop {
        owner: address,
        model: vector<u8>,                // vector<u8> instead of string
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

    public fun transfer_gpu(gpu: GPU, recipient: address): () {
        transfer::transfer(gpu, recipient)
    }
}

module 0x0::model_execution {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use sui::event;
    use 0x1::vector;

    public struct ModelExecution has key, store {
        id: UID,
        model_hash: vector<u8>,
        gpu_owner: address,
        start_block: u64,
        completed: bool,
    }

    public struct ExecutionCreated has copy, drop {
        model_hash: vector<u8>,
        gpu_owner: address,
        start_block: u64,
    }

    public struct ExecutionCompleted has copy, drop {
        model_hash: vector<u8>,
        gpu_owner: address,
        end_block: u64,
    }

    public fun create_execution(
        model_hash: vector<u8>,
        gpu_owner: address,
        block: u64,
        ctx: &mut TxContext
    ): ModelExecution {
        let uid = object::new(ctx);

        let execution = ModelExecution {
            id: uid,
            model_hash,
            gpu_owner,
            start_block: block,
            completed: false,
        };

        event::emit(ExecutionCreated {
            model_hash: execution.model_hash,
            gpu_owner: execution.gpu_owner,
            start_block: execution.start_block,
        });

        execution
    }

    public fun complete_execution(
        exec: &mut ModelExecution,
        block: u64
    ) {
        exec.completed = true;

        event::emit(ExecutionCompleted {
            model_hash: exec.model_hash,
            gpu_owner: exec.gpu_owner,
            end_block: block,
        });
    }
}

///////////////////////////////////////////////////////////////////////////////////////////

this is the running smartcontract what i test with frontend  :



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
