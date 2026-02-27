import ap.steps
import ap.pool

schema Hook:
    steps?: [steps.Step]
    pool?: pool.Pool

schema OnSuccessOrFailureHook:
    failure?: Hook
    success?: Hook
