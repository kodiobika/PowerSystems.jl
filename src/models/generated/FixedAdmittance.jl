#=
This file is auto-generated. Do not edit.
=#
"""
    mutable struct FixedAdmittance <: ElectricLoad
        name::String
        available::Bool
        bus::Bus
        Y::Complex{Float64}
        ext::Dict{String, Any}
        _forecasts::InfrastructureSystems.Forecasts
        internal::InfrastructureSystemsInternal
    end



# Arguments
- `name::String`
- `available::Bool`
- `bus::Bus`
- `Y::Complex{Float64}`: System per-unit value
- `ext::Dict{String, Any}`
- `_forecasts::InfrastructureSystems.Forecasts`
- `internal::InfrastructureSystemsInternal`: power system internal reference, do not modify
"""
mutable struct FixedAdmittance <: ElectricLoad
    name::String
    available::Bool
    bus::Bus
    "System per-unit value"
    Y::Complex{Float64}
    ext::Dict{String, Any}
    _forecasts::InfrastructureSystems.Forecasts
    "power system internal reference, do not modify"
    internal::InfrastructureSystemsInternal
end

function FixedAdmittance(name, available, bus, Y, ext=Dict{String, Any}(), _forecasts=InfrastructureSystems.Forecasts(), )
    FixedAdmittance(name, available, bus, Y, ext, _forecasts, InfrastructureSystemsInternal(), )
end

function FixedAdmittance(; name, available, bus, Y, ext=Dict{String, Any}(), _forecasts=InfrastructureSystems.Forecasts(), )
    FixedAdmittance(name, available, bus, Y, ext, _forecasts, )
end


# Constructor for demo purposes; non-functional.
function FixedAdmittance(::Nothing)
    FixedAdmittance(;
        name="init",
        available=false,
        bus=Bus(nothing),
        Y=0.0,
        ext=Dict{String, Any}(),
        _forecasts=InfrastructureSystems.Forecasts(),
    )
end

"""Get FixedAdmittance name."""
get_name(value::FixedAdmittance) = value.name
"""Get FixedAdmittance available."""
get_available(value::FixedAdmittance) = value.available
"""Get FixedAdmittance bus."""
get_bus(value::FixedAdmittance) = value.bus
"""Get FixedAdmittance Y."""
get_Y(value::FixedAdmittance) = value.Y
"""Get FixedAdmittance ext."""
get_ext(value::FixedAdmittance) = value.ext
"""Get FixedAdmittance _forecasts."""
get__forecasts(value::FixedAdmittance) = value._forecasts
"""Get FixedAdmittance internal."""
get_internal(value::FixedAdmittance) = value.internal
