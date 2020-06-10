mutable struct RegulationDevice{T <: StaticInjection} <: Device
    device::T
    droop::Float64
    participation_factor::NamedTuple{(:up, :dn), Tuple{Float64, Float64}}
    reserve_limit_up::Float64
    reserve_limit_dn::Float64
    inertia::Float64
    cost::Float64
    forecasts::IS.Forecasts

    function RegulationDevice{T}(
        device::T,
        droop::Float64,
        participation_factor::NamedTuple{(:up, :dn), Tuple{Float64, Float64}},
        reserve_limit_up::Float64,
        reserve_limit_dn::Float64,
        inertia::Float64,
        cost::Float64,
        forecasts::IS.Forecasts = IS.Forecasts(),
    ) where {T <: StaticInjection}
        # Note that forecasts are not forwarded to T. They get copied from T in
        # handle_component_addition!.
        IS.@forward((RegulationDevice{T}, :device), T)
        new{T}(
            device,
            droop,
            participation_factor,
            reserve_limit_up,
            reserve_limit_dn,
            inertia,
            cost,
            forecasts,
        )
    end
end

function RegulationDevice(
    device::T;
    droop::Float64 = Inf,
    participation_factor::NamedTuple{(:up, :dn), Tuple{Float64, Float64}} = (
        up = 0.0,
        dn = 0.0,
    ),
    reserve_limit_up::Float64 = 0.0,
    reserve_limit_dn::Float64 = 0.0,
    inertia::Float64 = 0.0,
    cost::Float64 = 1.0,
) where {T <: StaticInjection}
    return RegulationDevice{T}(
        device,
        droop,
        participation_factor,
        reserve_limit_up,
        reserve_limit_dn,
        inertia,
        cost,
    )
end

function has_forecasts(d::RegulationDevice)
    return IS.has_forecasts(d.device)
end

IS.get_forecasts(value::RegulationDevice) = value.forecasts
IS.get_name(value::RegulationDevice) = IS.get_name(value.device)
IS.get_uuid(value::RegulationDevice) = IS.get_uuid(value.device)
get_droop(value::RegulationDevice) = value.droop
get_participation_factor(value::RegulationDevice) = value.participation_factor
get_reserve_limit_up(value::RegulationDevice) = value.reserve_limit_up
get_reserve_limit_dn(value::RegulationDevice) = value.reserve_limit_dn
get_inertia(value::RegulationDevice) = value.inertia
get_cost(value::RegulationDevice) = value.cost

set_droop!(value::RegulationDevice, val::Float64) = value.droop = val
set_participation_factor!(value::RegulationDevice, val::Float64) =
    value.participation_factor = val
set_reserve_limit_up!(value::RegulationDevice, val::Float64) = value.reserve_limit_up = val
set_reserve_limit_dn!(value::RegulationDevice, val::Float64) = value.reserve_limit_dn = val
set_inertia!(value::RegulationDevice, val::Float64) = value.inertia = val
set_cost!(value::RegulationDevice, val::Float64) = value.cost = val
IS.set_forecasts!(value::RegulationDevice, val::IS.Forecasts) = value.forecasts = val
