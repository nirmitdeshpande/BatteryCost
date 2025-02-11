#TODO: Add Keyword Constructors for all datatypes
#TODO MAYBE: Create + methods to build cells
#TODO: add NMC811
#TODO: update NMC622 and LFP costs

#include("Cell_Designer.jl")
#include("Cost_Inputs_Taxonomy.jl")



nca_default() = struct_electrode(
                                  "NCA",                # Chemistry type
                                  0.03,                 # binder weight fraction
                                  0.03,                 # conductive material weight fraction
                                  4.71,                 # AM density
                                  1.77,                 # binder density
                                  1.77,                 # conductive material density
                                  192.0,                # first charge specific capacity
                                  180.0,                # reversible specific capacity
                                  150.0,                # total thickness cathode
                                  0.2,                  # porosity
                                  0.0,                  # extra length
                                  15.0,                 # Pos foil (Al) thickness                      microns
                                  2.7,                  # Positive foil density
                                  7.0,                  # Tab thickness                                microns
                                  6.0,                  # Tab width                                      mm
                                  8.88,                 # Tab density (Ni)                              g/cm3
                                )




nmc811_default() = struct_electrode(

                                  "NMC811",     # Chemistry type
                                  0.03,         # binder weight fraction
                                  0.03,         # Conductive material weight fraction
                                  4.7,          # AM density
                                  1.77,         # binder density
                                  1.77,         # conductive material density
                                  195.0,        # first charge specific capacity
                                  171.0,        # reversible specific capactity
                                  50.0,         # total thickness cathode
                                  0.3,          # porosity
                                  0.0,          # extra length
                                  15.0,         # Pos foil (Al) thickness                      microns
                                  2.7,          # Pos foil density
                                  7.0,          # Tab thickness                                microns
                                  6.0,          # Tab width                                      mm
                                  8.88,         # Tab density
                                )

#CITATION: NMC811 attribute values from Intercalation Station, Matt Lacey
# TODO revise using Battery Component Price Report 2023



                               
nmc622_default() = struct_electrode(

                                    "NMC622",     # Chemistry type
                                    0.03,         # binder weight fraction
                                    0.03,         # Conductive material weight fraction
                                    4.8,          # AM density
                                    1.77,         # binder density
                                    1.77,         # conductive material density
                                    190.0,        # first charge specific capacity
                                    171.0,        # reversible specific capactity
                                    150.0,        # total thickness cathode
                                    0.2,          # porosity
                                    0.0,          # extra length
                                    15.0,         # Pos foil (Al) thickness                      microns
                                    2.7,          # Pos foil density
                                    7.0,          # Tab thickness                                microns
                                    6.0,          # Tab width                                      mm
                                    8.88,         # Tab density
                                  )

lfp_default() = struct_electrode(
                                  "LFP",        # Chemistry type
                                  0.03,         # binder weight fraction
                                  0.03,         # conductive material weight fraction
                                  3.6,          # AM density
                                  1.77,         # binder density
                                  1.77,         # conductive material density
                                  160.0,        # first charge specific capacity
                                  150.0,        # reversible specific capacity
                                  150.0,        # total thickness cathode
                                  0.2,          # porosity
                                  0.0,          # extra length
                                  15.0,         # Pos foil (Al) thickness                      microns
                                  2.7,          # Pos foil density
                                  7.0,          # Tab thickness                                microns
                                  6.0,          # Tab width                                      mm
                                  8.88,         # Tab density
                                )


graphite_default() = struct_electrode(

                                  "Graphite",               # Chemistry type

                                  0.03,                     # binder weight fraction
                                  0.03,                     # conductive weight fraction

                                  2.24,                     # AM density
                                  1.77,                     # binder density
                                  1.77,                     # conductive density

                                  371.93,                   # first charge specific capacity
                                  350.0,                    # reversible specific capacity

                                  150.0,                    # total thickness cathode
                                  0.3,                      # porosity

                                  40.0,                     # Extra length                                   mm

                                  8.0,                      # Neg foil (Cu) thickness                      microns
                                  8.92,                     # Neg foil (Cu) density                         g/cm3

                                  7.0,                      # Tab thickness                                microns
                                  6.0,                      # Tab width                                      mm
                                  8.88,                     # Tab density (Ni)                              g/cm3
                                  )


cell(;form_factor="Cyl", size="18650", dimensional_delta=0.01,
    can_th=0.05, can_rho=7.7, sep_th=20.0, sep_rho=1.2,
    sep_por=0.4, v_nom=3.6, electrolyte_name="EC:DMC",
    electrolyte_rho=1.2, NP=1.15,
    anode=graphite_default(), cathode=nca_default()) = struct_cell_general(
                                      form_factor,              # Form factor                           ["Cyl","Pris","Pou"]
                                       size,                    # Cell size                                    5 digits
                                       dimensional_delta,       # dimensional_delta                               %
                                       can_th,                  # canister thickness                             (mm)
                                       can_rho,                 # Stainless Steel density                        g/cm3

                                       sep_th,                  # Separator thickness                          microns
                                       sep_rho,                 # Separator density                             g/cm3
                                       sep_por,                 # Separator porosity

                                       v_nom,                   # Nominal voltage                                 V

                                       electrolyte_name,        # Electrolyte name
                                       electrolyte_rho,         # Electrolyte density                           g/cm3

                                       NP,                      # N to P ratio


                                       anode,                   # Anode Struct
                                       cathode,                 # Cathode Struct
                                       )



cathode_default_cost() = struct_electrode_costs(
                                                [24.0, 0.9],            # Cost of Positive Active Material                       # USD/kg
                                                [6.6, 1.0],             # Cost of Positive Conductive                            # USD/kg
                                                [9.5, 1.0],             # Cost of Positive Binder                                # USD/kg
                                                [3.1, 1.0],             # Cost of Positive Binder Solvent                        # USD/kg
                                                [10193620.403506],      # Baseline annual positive active material               # kg/year
                                                [13744207.2856261],     # Baseline annual positive binder solvent evaporated     # kg/year
                                                [96.0 / 4.0],           # Multiplier for binder solvent requirement
                                                [0.3, 1.0],             # Cost of Positive Current Collector                     # USD/m2
                                                [0.15, 0.8],            # Cost of Positive Terminal Assembly                     # USD/cell
                                                [0.922],                # Positive Electrode Material (dry) yield
                                                [0.902],                # Positive Current Collector yield
                                              )


anode_default_cost() = struct_electrode_costs(
                                              [12.5, 0.95],                # Cost of Negative Active Material                       # USD/kg
                                              [6.6, 1.0],                  # Cost of Negative Conductive                            # USD/kg
                                              [10.0, 1.0],                 # Cost of Negative Binder                                # USD/kg
                                              ########### Negative binder solvent cost - water
                                              [0.0, 0.9],                  # !!!!!!!!!!! Check !!!!!!!!!!!!!!!!!
                                              [6564082.00851682],          # Baseline annual negative active material               # kg/year
                                              [8291472.01075809],          # Baseline annual negative binder solvent evaporated     # kg/year
                                              [96.0 / 4.0],                # Multiplier for binder solvent requirement
                                              [1.2, 1.0],                  # Cost of Negative Current Collector                     # USD/m2
                                              [0.15, 0.8],                 # Cost of Negative Terminal Assembly                     # USD/cell
                                              [0.922],                     # Negative Electrode Material (dry) yield
                                              [0.902],                     # Negative Current Collector yield
                                            )


cell_costs_default() = struct_cell_costs(
                                          [0.22, 0.8],           # Cost of Cell Canister                                  # USD/cell
                                          [1.1, 1.0],            # Cost of Separator                                      # USD/m2
                                          0.98,                  # Separator yield
                                          [15.0, 1.0],           # Cost of Electrolyte                                    # USD/L
                                          0.94,                  # Electrolyte yield
                                          0.95,                  # Cell yield
                                          cathode_default_cost(),
                                          anode_default_cost(),
                                        )



baseline_cell_assembly_data_default() = struct_manufacturing(
                                                              # Receiving
                                                              [
                                                                14400.0 0.4           # Direct Labor
                                                                3.6 0.6               # Capital Equipment
                                                                900.0 0.5             # Plant Area
                                                                1.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # pos_mat_prep
                                                              [
                                                                14400.0 0.5           # Direct Labor
                                                                2.0 0.7               # Capital Equipment
                                                                600.0 0.6             # Plant Area
                                                                2.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # neg_mat_prep
                                                              [
                                                                14400.0 0.5           # Direct Labor
                                                                2.0 0.7               # Capital Equipment
                                                                600.0 0.6             # Plant Area
                                                                3.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # pos_electrode_coat
                                                              [
                                                                28800.0 0.5           # Direct Labor
                                                                8.0 0.8               # Capital Equipment
                                                                750.0 0.8             # Plant Area
                                                                4.0 1.0               # [volume ratio, special case]
                                                              ],

                                                              # neg_electrode_coat
                                                              [
                                                                28800.0 0.5           # Direct Labor
                                                                8.0 0.8               # Capital Equipment
                                                                750.0 0.8             # Plant Area
                                                                4.0 1.0               # [volume ratio, special case]
                                                              ],

                                                              # bind_slvnt_recov
                                                              [
                                                                14400.0 0.4           # Direct Labor
                                                                3.0 0.6               # Capital Equipment
                                                                225.0 0.6             # Plant Area
                                                                5.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # pos_calendr
                                                              [
                                                                14400.0 0.5           # Direct Labor
                                                                1.0 0.7               # Capital Equipment
                                                                225.0 0.6             # Plant Area
                                                                4.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # neg_calendr
                                                              [
                                                                7200.0 0.5            # Direct Labor
                                                                1.0 0.7               # Capital Equipment
                                                                225.0 0.6             # Plant Area
                                                                4.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # intr_process_mat_handling
                                                              [
                                                                28800.0 0.7           # Direct Labor
                                                                1.5 0.7               # Capital Equipment
                                                                900.0 0.6             # Plant Area
                                                                4.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # electrode_slitting
                                                              [
                                                                28800.0 0.5           # Direct Labor
                                                                2.0 0.7               # Capital Equipment
                                                                300.0 0.6             # Plant Area
                                                                4.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # vacuum_drying
                                                              [
                                                                14400.0 0.5           # Direct Labor
                                                                1.6 0.7               # Capital Equipment
                                                                300.0 0.6             # Plant Area
                                                                4.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # control_lab
                                                              [
                                                                28800.0 0.5           # Direct Labor
                                                                1.5 0.7               # Capital Equipment
                                                                300.0 0.6             # Plant Area
                                                                1.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # cell_winding
                                                              [
                                                                36000.0 0.7           # Direct Labor
                                                                4.0 0.8               # Capital Equipment
                                                                600.0 0.8             # Plant Area
                                                                6.0 2.0               # [volume ratio, special case]
                                                              ],

                                                              # CC_welding
                                                              [
                                                                36000.0 0.7           # Direct Labor
                                                                4.0 0.8               # Capital Equipment
                                                                600.0 0.8             # Plant Area
                                                                6.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # cell_insertion_container
                                                              [
                                                                21600.0 0.5           # Direct Labor
                                                                3.0 0.7               # Capital Equipment
                                                                600.0 0.6             # Plant Area
                                                                6.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # electrolyte_filling_and_cell_sealing
                                                              [
                                                                36000.0 0.5           # Direct Labor
                                                                5.0 0.7               # Capital Equipment
                                                                900.0 0.6             # Plant Area
                                                                6.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # dry_room_control
                                                              [
                                                                14400.0 0.4           # Direct Labor
                                                                20.0 0.6              # Capital Equipment
                                                                100.0 0.4             # Plant Area
                                                                7.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # formation_cycling
                                                              [
                                                                57600.0 0.7           # Direct Labor
                                                                30.0 0.8              # Capital Equipment
                                                                2200.0 0.8            # Plant Area
                                                                6.0 2.0               # [volume ratio, special case]
                                                              ],

                                                              # cell_sealing
                                                              [
                                                                14400.0 0.5           # Direct Labor
                                                                2.0 0.7               # Capital Equipment
                                                                450.0 0.6             # Plant Area
                                                                6.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # charge_retention_testing
                                                              [
                                                                21600.0 0.4           # Direct Labor
                                                                4.75 0.7              # Capital Equipment
                                                                900.0 0.6             # Plant Area
                                                                6.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # rejected_cell_scrap_recycle_assembly
                                                              [
                                                                36000.0 0.7           # Direct Labor
                                                                2.5 0.7               # Capital Equipment
                                                                600.0 0.6             # Plant Area
                                                                6.0 0.0               # [volume ratio, special case]
                                                              ],

                                                              # Shipping
                                                              [
                                                                28800.0 0.5           # Direct Labor
                                                                5.0 0.7               # Capital Equipment
                                                                900.0 0.6             # Plant Area
                                                                1.0 0.0               # [volume ratio, special case]
                                                              ],
                                                            )


costs_data_default() = struct_general_costs(
                                            715.0,                       # Pack Integration Cost                                  # USD/Pack
                                            3000.0,                      # Building cost                                          #  USD/m2
                                            18.0,                        # Labor cost                                             # $/hr
                                            150.0,                       # No of units mfg per energy_kwh_per_year                Million
                                            0.995,                       # Positive Binder Solvent Recovery percentage
                                            baseline_cell_assembly_data_default(),
                                            1.1,                         # formation_cycling_mult
                                            1.1,                         # cell_stacking_mult
                                            0.2,                         # pos_electrode_coating_solvent_SR
                                            0.2,                         # neg_electrode_coating_solvent_SR
                                          )


baseline_data_default() = struct_baseline(
                                          6000000.0,               # Baseline annual energy                                   # kWh/year
                                          25263158.0,              # Baseline annual cells adjusted for yield                 # cells/year
                                          67669329.6866343,        # Baseline annual electrode area                           # m2/year
                                          6100.0,
                                        )


battery_pack_data_default() = struct_pack_level(240.0,)





ovhd_rate_data_default() = struct_ovhd_rate(
                                            5.0 / 100.0,                      # Launch cost percent direct annual materials
                                            10.0 / 100.0,                     # Launch cost percent direct labor plus variable overhead
                                            16.666667 / 100.0,                # Depreciation rate capital equipment                          # 6-year rate
                                            5.0 / 100.0,                      # Depreciation rate building investment                        # 20 year rate
                                            25.0 / 100.0,                     # General, Sales and Administration rate direct labor plus variable overhead
                                            25.0 / 100.0,                     # General, Sales and Administration rate depreciation
                                            40.0 / 100.0,                     # R & D rate depreciation
                                            40.0 / 100.0,                     # Variable overhead rate direct labor
                                            20.0 / 100.0,                     # Variable overhead rate depreciation
                                            5.0 / 100.0,                      # Profit rate after taxes                                      # % of investment
                                            15.0 / 100.0,                     # Working capital rate                                         # % of annual variable cost
                                            5.6 / 100.0,                      # Warranty cost added to the price rate
                                          )



cost_default() = struct_cost(
  cell_costs_default(),
  baseline_cell_assembly_data_default(),
  costs_data_default(),
  baseline_data_default(),
  ovhd_rate_data_default(),
)
