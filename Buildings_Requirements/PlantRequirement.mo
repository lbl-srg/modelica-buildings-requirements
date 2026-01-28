within Buildings_Requirements;
block PlantRequirement
  "This is a template block that can be used to check requirements on a heating and cooling plant typical components"
    parameter Integer nHeaPum=1
    "Number of heat pumps to check"
    annotation (Evaluate=true, Dialog(group="Heat pumps"));
    parameter Modelica.Units.SI.Time durationMinHeaPumOn(displayUnit="min") = 1800
    "Minimum duration heat pumps must remain on" annotation(Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Modelica.Units.SI.Time durationMinHeaPumOff(displayUnit="min") = 600
    "Minimum duration heat pumps must remain off" annotation(Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Modelica.Units.SI.Time delayTimeHeaPum(each displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation (Dialog(group="Heat pumps", enable=nHeaPum > 0));

    parameter Real dTallBanHeaPum(
    final unit="K",
    each displayUnit="K") = 1 "Allowable error band when tracking setpoint" annotation (Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Real TMaxHeaPum(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed heat pump supply temperature"  annotation(Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Real TMinHeaPum(
    final unit="K",
    each displayUnit="K") = 273.15 + 10 "Minimum heat pump supply temperature"  annotation (Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Real dTSupRetMaxHeaPum(
    final unit="K",
    each displayUnit="K") = 20
    "Maximum difference between heat pump supply and return temperatures"  annotation (Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Real dTSupRetMinHeaPum(
    final unit="K",
    each displayUnit="K") = 2 "Minimum "  annotation (Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Modelica.Units.SI.Time tWinHeaPum=360
    "Length of sliding time window for heat pumps supply temperature in seconds"
    annotation (Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Real tSupHeaPum=1/(60*(TMaxHeaPum-TMinHeaPum))
    "Average heat pump supply temperature speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Heat pumps", enable=nHeaPum > 0));
    parameter Integer nBoi=0
    "Number of boiler to check"
    annotation(Evaluate=true,Dialog(group="Boilers"));
    parameter Modelica.Units.SI.Time durationMinBoiOn(displayUnit="min") = 1800
    "Minimum duration boiler must remain on" annotation(Dialog(group="Boilers", enable=nBoi > 0));
    parameter Modelica.Units.SI.Time durationMinBoiOff(displayUnit="min") = 600
    "Minimum duration boiler must remain off" annotation(Dialog(group="Boilers", enable=nBoi > 0));
    parameter Modelica.Units.SI.Time delayTimeBoi(each displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation (Dialog(group="Boilers", enable=nBoi > 0));

    parameter Real dTallBanBoi(
    final unit="K",
    each displayUnit="K") = 1 "Allowable error band when tracking setpoint" annotation (Dialog(group="Boilers", enable=nBoi > 0));
    parameter Real TMaxBoi(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed boiler supply temperature"  annotation (Dialog(group="Boilers", enable=nBoi > 0));
    parameter Real TMinBoi(
    final unit="K",
    each displayUnit="K") = 273.15 + 10 "Minimum boiler supply temperature"  annotation (Dialog(group="Boilers", enable=nBoi > 0));
    parameter Real dTSupRetMaxBoi(
    final unit="K",
    each displayUnit="K") = 20
    "Maximum difference between boiler supply and return temperatures"  annotation (Dialog(group="Boilers", enable=nBoi > 0));
    parameter Real dTSupRetMinBoi(
    final unit="K",
    each displayUnit="K") = 4 "Minimum "  annotation (Dialog(group="Boilers", enable=nBoi > 0));
    parameter Modelica.Units.SI.Time tWinBoi=360
     "Length of sliding time window for boiler supply temperature in seconds"
    annotation (Dialog(group="Boilers", enable=nBoi > 0));
    parameter Real tSupBoi = 1/(60*(TMaxBoi-TMinBoi))
    "Average boiler supply temperature speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Boilers", enable=nBoi > 0));
    parameter Integer nChi=1
    "Number of chiller to check"
   annotation(Evaluate=true,Dialog(group="Chillers"));
    parameter Modelica.Units.SI.Time durationMinChiOn(displayUnit="min") = 1800
    "Minimum duration chiller must remain on" annotation(Dialog(group="Chillers", enable=nChi > 0));
    parameter Modelica.Units.SI.Time durationMinChiOff(displayUnit="min") = 600
    "Minimum duration chiller must remain off" annotation(Dialog(group="Chillers", enable=nChi > 0));
    parameter Modelica.Units.SI.Time delayTimeChi(each displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Real dTallBanChi(
    final unit="K",
    each displayUnit="K") = 1 "Allowable error band when tracking setpoint" annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Real TMaxChi(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed chiller supply temperature"  annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Real TMinChi(
    final unit="K",
    each displayUnit="K") = 273.15 + 10 "Minimum chiller supply temperature"  annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Real dTSupRetMaxChi(
    final unit="K",
    each displayUnit="K") = 20
    "Maximum difference between chiller supply and return temperatures"  annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Real dTSupRetMinChi(
    final unit="K",
    each displayUnit="K") = 4 "Minimum "  annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Modelica.Units.SI.Time tWinChi=360
     "Length of sliding time window for chiller supply temperature in seconds"
    annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Real tSupChi = 1/(60*(TMaxChi-TMinChi))
    "Average chiller supply temperature speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Chillers", enable=nChi > 0));
    parameter Integer nHeaChi=1
    "Number of heat recovery chiller to check"
    annotation(Evaluate=true,Dialog(group="Heat recovery chillers"));
    parameter Modelica.Units.SI.Time durationMinHeaChiOn(displayUnit="min") = 1800
    "Minimum duration heat recovery chiller must remain on" annotation(Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Modelica.Units.SI.Time durationMinHeaChiOff(displayUnit="min") = 600
    "Minimum duration heat recovery chiller must remain off" annotation(Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Modelica.Units.SI.Time delayTimeHeaChi(each displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));

    parameter Real dTallBanHeaChi(
    final unit="K",
    each displayUnit="K") = 1 "Allowable error band when tracking setpoint" annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Real TMaxHeaChi(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed heat recovery chiller supply temperature"  annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Real TMinHeaChi(
    final unit="K",
    each displayUnit="K") = 273.15 + 10 "Minimum heat recovery chiller supply temperature"  annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Real dTSupRetMaxHeaChi(
    final unit="K",
    each displayUnit="K") = 20
    "Maximum difference between heat recovery chiller supply and return temperatures"  annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Real dTSupRetMinHeaChi(
    final unit="K",
    each displayUnit="K") = 4 "Minimum "  annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Modelica.Units.SI.Time tWinHeaChi=360
     "Length of sliding time window for heat recovery chiller supply temperature in seconds"
    annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Real tSupHeaChi = 1/(60*(TMaxHeaChi-TMinHeaChi))
    "Average heat recovery chiller supply temperature speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Heat recovery chillers", enable=nHeaChi > 0));
    parameter Integer nHeaPla=1
    "Number of heating loops to check"
    annotation(Evaluate=true,Dialog(group="Heating plant"));
    parameter Modelica.Units.SI.Time durationMinHeaPlaOn(displayUnit="min") = 1800
    "Minimum duration heating plant must remain on" annotation(Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Modelica.Units.SI.Time durationMinHeaPlaOff(displayUnit="min") = 600
    "Minimum duration heating plant must remain off" annotation(Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Modelica.Units.SI.Time delayTimeHeaPla(each displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));

    parameter Real dTallBanHeaPla(
    final unit="K",
    each displayUnit="K") = 1 "Allowable error band when tracking setpoint" annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Real TMaxHeaPla(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed heating plant supply temperature"  annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Real TMinHeaPla(
    final unit="K",
    each displayUnit="K") = 273.15 + 10 "Minimum heating plant supply temperature"  annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Real dTSupRetMaxHeaPla(
    final unit="K",
    each displayUnit="K") = 20
    "Maximum difference between heating plant supply and return temperatures"  annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Real dTSupRetMinHeaPla(
    final unit="K",
    each displayUnit="K") = 4 "Minimum "  annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Modelica.Units.SI.Time tWinHeaPla=360
     "Length of sliding time window for heating plant supply temperature in seconds"
    annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Real tSupHeaPla = 1/(60*(TMaxHeaPla-TMinHeaPla))
    "Average heating plant supply temperature speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Heating plant", enable=nHeaPla > 0));
    parameter Integer nCooPla=1
    "Number of cooling loops to check"
    annotation(Evaluate=true,Dialog(group="Cooling plant"));
    parameter Modelica.Units.SI.Time durationMinCooPlaOn(displayUnit="min") = 1800
    "Minimum duration cooling plant must remain on" annotation(Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Modelica.Units.SI.Time durationMinCooPlaOff(displayUnit="min") = 600
    "Minimum duration cooling plant must remain off" annotation(Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Modelica.Units.SI.Time delayTimeCooPla(each displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));

    parameter Real dTallBanCooPla(
    final unit="K",
    each displayUnit="K") = 1 "Allowable error band when tracking setpoint" annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Real TMaxCooPla(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed cooling plant supply temperature"  annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Real TMinCooPla(
    final unit="K",
    each displayUnit="K") = 273.15 + 10 "Minimum cooling plant supply temperature"  annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Real dTSupRetMaxCooPla(
    final unit="K",
    each displayUnit="K") = 20
    "Maximum difference between cooling plant supply and return temperatures"  annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Real dTSupRetMinCooPla(
    final unit="K",
    each displayUnit="K") = 4 "Minimum "  annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Modelica.Units.SI.Time tWinCooPla=360
     "Length of sliding time window for cooling plant supply temperature in seconds"
    annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Real tSupCooPla=1/(60*(TMaxCooPla-TMinCooPla))
    "Average cooling plant supply temperature speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Cooling plant", enable=nCooPla > 0));
    parameter Integer nTan=1
    "Number of tanks to check"
    annotation (Evaluate=true, Dialog(group="Tanks"));
    parameter Modelica.Units.SI.Time delayTimeTan(each displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation (Dialog(group="Tanks", enable=nTan > 0));
    parameter Integer nTanLay=1
    "Number of tank temperature layers to check"
    annotation (Evaluate=true, Dialog(group="Tanks", enable=nTan >0));
    parameter Real TMaxTan(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed tank temperature"  annotation (Dialog(group="Tanks", enable=nTan > 0));
    parameter Real TMinTan(
    final unit="K",
    each displayUnit="K") = 273.15 + 2
    "Minimum allowed tank temperature"  annotation (Dialog(group="Tanks", enable=nTan > 0));
    parameter Integer nPum=1
    "Number of pumps to check"
    annotation (Evaluate=true, Dialog(group="Pumps"));
    parameter Modelica.Units.SI.Time durationMinPumOn(displayUnit="min") = 300
    "Minimum duration pumps must remain on" annotation(Dialog(group="Pumps", enable=nPum > 0));
    parameter Modelica.Units.SI.Time durationMinPumOff(displayUnit="min") = 60
    "Minimum duration pumps must remain off" annotation(Dialog(group="Pumps", enable=nPum > 0));

    parameter Modelica.Units.SI.Time delayTimePum(each displayUnit="min") = 60  "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true" annotation (Dialog(group="Pumps", enable=nPum > 0));
    parameter Modelica.Units.SI.MassFlowRate mMax_flow = 10 "Maximum mass flow rate allowed in the pump"  annotation (Dialog(group="Pumps", enable=nPum > 0));
    parameter Modelica.Units.SI.PressureDifference dpPumMax(displayUnit="Pa") = 10000 "Maximum pressure difference across pump" annotation (Dialog(group="Pumps", enable=nPum > 0));
    parameter Modelica.Units.SI.Time tWinPum=120
     "Length of sliding time window for pump control signal in seconds"
    annotation (Dialog(group="Pumps", enable=nPum > 0));
    parameter Real tPum=0.05
    "Average pump control signal speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Pumps", enable=nPum > 0));

    parameter Integer nVal=1
    "Number of valves to check"
    annotation (Evaluate=true, Dialog(group="Valves"));
    parameter Modelica.Units.SI.Time tWinVal=120
     "Length of sliding time window for valve position in seconds"
    annotation (Dialog(group="Valves", enable=nVal > 0));
    parameter Real tVal=0.05
    "Average valve position speed during the sliding window above which the signal is deemed as unstable"
    annotation (Dialog(group="Valves", enable=nVal > 0));







  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yHeaPum[nHeaPum]
    if nHeaPum > 0 "Heat pumps on signal" annotation (Placement(transformation(
          extent={{-120,60},{-80,100}}),iconTransformation(extent={{-140,-118},{
            -100,-78}})));

  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yBoi[nBoi] if nBoi > 0
    "Boilers on signal" annotation (Placement(transformation(extent={{-120,-60},
            {-80,-20}}),
                       iconTransformation(extent={{-140,-198},{-100,-158}})));

  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yChi[nChi] if nChi > 0
    "Chillers on signal" annotation (Placement(transformation(extent={{-120,-186},
            {-80,-146}}),
                       iconTransformation(extent={{-140,-278},{-100,-238}})));

  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yHeaChi[nHeaChi]
    if nHeaChi > 0 "Heat recovery chillers on signal" annotation (Placement(
        transformation(extent={{-120,-310},{-80,-270}}),
                                                      iconTransformation(extent={{-140,
            -358},{-100,-318}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yPum[nPum] if nPum > 0
    "Pumps on signal" annotation (Placement(transformation(extent={{-120,-790},{
            -80,-750}}),
                    iconTransformation(extent={{-140,-678},{-100,-638}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yVal[nVal] if nVal > 0
    "Valves on signal" annotation (Placement(transformation(extent={{-120,-910},
            {-80,-870}}),
                        iconTransformation(extent={{-140,-758},{-100,-718}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupHeaPum[nHeaPum](final unit="K",
      displayUnit="degC") if nHeaPum > 0 "Heat pumps supply temperature"
    annotation (Placement(transformation(extent={{-120,30},{-80,70}}),
        iconTransformation(extent={{-140,-138},{-100,-98}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TRetHeaPum[nHeaPum](final unit="K",
      displayUnit="degC") if nHeaPum > 0 "Heat pumps return temperature"
    annotation (Placement(transformation(extent={{-120,0},{-80,40}}),
        iconTransformation(extent={{-140,-158},{-100,-118}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TRetBoi[nBoi](final unit="K",
      displayUnit="degC") if nBoi > 0 "Boilers return temperature"
    annotation (Placement(transformation(extent={{-120,-120},{-80,-80}}),
        iconTransformation(extent={{-140,-238},{-100,-198}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupBoi[nBoi](final unit="K",
      displayUnit="degC") if nBoi > 0 "Boiler supply temperature"
    annotation (Placement(transformation(extent={{-120,-90},{-80,-50}}),
        iconTransformation(extent={{-140,-218},{-100,-178}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TRetChi[nChi](final unit="K",
      displayUnit="degC") if nChi > 0 "Chiller return temperature"
    annotation (Placement(transformation(extent={{-120,-250},{-80,-210}}),
        iconTransformation(extent={{-140,-318},{-100,-278}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TsupChi[nChi](final unit="K",
      displayUnit="degC") if nChi > 0 "Chillers supply temperature"
    annotation (Placement(transformation(extent={{-120,-220},{-80,-180}}),
        iconTransformation(extent={{-140,-298},{-100,-258}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TRetHeaChi[nHeaChi](final unit="K",
      displayUnit="degC") if nHeaChi > 0
    "Heat recovery chillers return temperature"
    annotation (Placement(transformation(extent={{-120,-370},{-80,-330}}),
        iconTransformation(extent={{-140,-398},{-100,-358}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupHeaChi[nHeaChi](final unit="K",
      displayUnit="degC") if nHeaChi > 0
    "Heat recovery chiller supply temperature"
    annotation (Placement(transformation(extent={{-120,-340},{-80,-300}}),
        iconTransformation(extent={{-140,-378},{-100,-338}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TRetHeaPla[nHeaPla](final
      unit="K", displayUnit="degC") if nHeaPla > 0
    "Heating return temperatures" annotation (Placement(transformation(extent={{
            -120,-490},{-80,-450}}), iconTransformation(extent={{-140,-478},{-100,
            -438}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupHeaPla[nHeaPla](final
      unit="K", displayUnit="degC") if nHeaPla > 0
    "Heating supply temperatures" annotation (Placement(transformation(extent={{
            -120,-460},{-80,-420}}), iconTransformation(extent={{-140,-458},{-100,
            -418}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupCooPla[nCooPla](final unit="K",
      displayUnit="degC") if nCooPla > 0 "Cooling supply temperatures"
    annotation (Placement(transformation(extent={{-120,-580},{-80,-540}}),
        iconTransformation(extent={{-140,-538},{-100,-498}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TRetCooPla[nCooPla](final unit="K",
      displayUnit="degC") if nCooPla > 0 "Cooling return temperatures"
    annotation (Placement(transformation(extent={{-120,-610},{-80,-570}}),
        iconTransformation(extent={{-140,-558},{-100,-518}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupSetHeaPum[nHeaPum](final
      unit="K", displayUnit="degC") if nHeaPum > 0
    "Heat pumps supply setpoint temperature" annotation (Placement(
        transformation(extent={{-120,-30},{-80,10}}), iconTransformation(extent={{-140,
            -178},{-100,-138}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSetBoi[nBoi](final unit="K",
      displayUnit="degC") if nBoi > 0 "Boilers setpoint temperature"
    annotation (Placement(transformation(extent={{-120,-150},{-80,-110}}),
        iconTransformation(extent={{-140,-258},{-100,-218}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSetChi[nChi](final unit="K",
      displayUnit="degC") if nChi > 0 "Chiller setpoint temperature"
    annotation (Placement(transformation(extent={{-120,-280},{-80,-240}}),
        iconTransformation(extent={{-140,-338},{-100,-298}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSetHeaChi[nHeaChi](final
      unit="K", displayUnit="degC") if nHeaChi > 0
    "Heat recovery chillers setpoint temperature" annotation (Placement(
        transformation(extent={{-120,-400},{-80,-360}}), iconTransformation(
          extent={{-140,-418},{-100,-378}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSetHeaPla[nHeaPla](final
      unit="K", displayUnit="degC") if nHeaPla > 0
    "Heating setpoint temperatures" annotation (Placement(transformation(extent=
           {{-120,-520},{-80,-480}}), iconTransformation(extent={{-140,-498},{-100,
            -458}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSetCooPla[nCooPla](final
      unit="K", displayUnit="degC") if nCooPla > 0
    "Cooling setpoint temperatures" annotation (Placement(transformation(extent={{-120,
            -640},{-80,-600}}),       iconTransformation(extent={{-140,-578},{-100,
            -538}})));

  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yHeaReq[nHeaPla]
    if nHeaPla > 0 "Is there an heating request signal" annotation (Placement(
        transformation(extent={{-120,-430},{-80,-390}}), iconTransformation(
          extent={{-140,-438},{-100,-398}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yCooReq[nCooPla]
    if nCooPla > 0 "Is there a cooling request signal" annotation (Placement(
        transformation(extent={{-120,-550},{-80,-510}}), iconTransformation(
          extent={{-140,-518},{-100,-478}})));

  Modelica.Blocks.Sources.BooleanExpression staVer(y=time >= tStart + 2*86400)
                             "Outputs true if system is ready for verification"
    annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
  Buildings.Controls.OBC.CDL.Logical.And and1[nHeaPum] if nHeaPum > 0
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep(nout=
        nHeaPum) if nHeaPum > 0
    annotation (Placement(transformation(extent={{-38,70},{-18,90}})));
  BaseClasses.HeatAndCoolingRequirements heaPumReq[nHeaPum](
    equNam="heat pump",
    durationMinEquOn=durationMinHeaPumOn,
    durationMinEquOff=durationMinHeaPumOff,
    delayTimeEqu=delayTimeHeaPum,
    dTallBanEqu=dTallBanHeaPum,
    TMaxEqu=TMaxHeaPum,
    TMinEqu=TMinHeaPum,
    dTSupRetMaxEqu=dTSupRetMaxHeaPum,
    dTSupRetMinEqu=dTSupRetMinHeaPum,
    tWinEqu=tWinHeaPum,
    tSupEqu=tSupHeaPum) if nHeaPum > 0
    annotation (Placement(transformation(extent={{100,62},{120,82}})));
  BaseClasses.HeatAndCoolingRequirements boiReq[nBoi](
    equNam="boiler",
    durationMinEquOn=durationMinBoiOn,
    durationMinEquOff=durationMinBoiOff,
    delayTimeEqu=delayTimeBoi,
    dTallBanEqu=dTallBanBoi,
    TMaxEqu=TMaxBoi,
    TMinEqu=TMinBoi,
    dTSupRetMaxEqu=dTSupRetMaxBoi,
    dTSupRetMinEqu=dTSupRetMinBoi,
    tWinEqu=tWinBoi,
    tSupEqu=tSupBoi) if nBoi > 0
    annotation (Placement(transformation(extent={{82,-62},{102,-42}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep1(nout=nBoi)
                 if nBoi > 0
    annotation (Placement(transformation(extent={{-38,-48},{-18,-28}})));
  Buildings.Controls.OBC.CDL.Logical.And and2[nBoi] if nBoi > 0
    annotation (Placement(transformation(extent={{0,-58},{20,-38}})));
  BaseClasses.HeatAndCoolingRequirements chiReq[nChi](
    equNam="chiller",
    durationMinEquOn=durationMinChiOn,
    durationMinEquOff=durationMinChiOff,
    delayTimeEqu=delayTimeChi,
    dTallBanEqu=dTallBanChi,
    TMaxEqu=TMaxChi,
    TMinEqu=TMinChi,
    dTSupRetMaxEqu=dTSupRetMaxChi,
    dTSupRetMinEqu=dTSupRetMinChi,
    tWinEqu=tWinChi,
    tSupEqu=tSupChi) if nChi > 0
    annotation (Placement(transformation(extent={{82,-192},{102,-172}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep2(nout=nChi)
    if nChi > 0
    annotation (Placement(transformation(extent={{-34,-180},{-14,-160}})));
  Buildings.Controls.OBC.CDL.Logical.And and3[nChi] if nChi > 0
    annotation (Placement(transformation(extent={{2,-192},{22,-172}})));
  BaseClasses.HeatAndCoolingRequirements heaChiReq[nHeaChi](
    equNam="heat recovery chiller",
    durationMinEquOn=durationMinHeaChiOn,
    durationMinEquOff=durationMinHeaChiOff,
    delayTimeEqu=delayTimeHeaChi,
    dTallBanEqu=dTallBanHeaChi,
    TMaxEqu=TMaxHeaChi,
    TMinEqu=TMinHeaChi,
    dTSupRetMaxEqu=dTSupRetMaxHeaChi,
    dTSupRetMinEqu=dTSupRetMinHeaChi,
    tWinEqu=tWinHeaChi,
    tSupEqu=tSupHeaChi) if nHeaChi > 0
    annotation (Placement(transformation(extent={{96,-312},{116,-292}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep3(nout=
        nHeaChi) if nHeaChi > 0
    annotation (Placement(transformation(extent={{-20,-300},{0,-280}})));
  Buildings.Controls.OBC.CDL.Logical.And and4[nHeaChi] if nHeaChi > 0
    annotation (Placement(transformation(extent={{16,-310},{36,-290}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep4(nout=
        nHeaPla) if nHeaPla > 0
    annotation (Placement(transformation(extent={{-14,-420},{6,-400}})));
  Buildings.Controls.OBC.CDL.Logical.And and5[nHeaPla] if nHeaPla > 0
    annotation (Placement(transformation(extent={{22,-430},{42,-410}})));
  BaseClasses.HeatAndCoolingRequirements heaPlaReq[nHeaPla](
    equNam="heating plant",
    durationMinEquOn=durationMinHeaPlaOn,
    durationMinEquOff=durationMinHeaPlaOff,
    delayTimeEqu=delayTimeHeaPla,
    dTallBanEqu=dTallBanHeaPla,
    TMaxEqu=TMaxHeaPla,
    TMinEqu=TMinHeaPla,
    dTSupRetMaxEqu=dTSupRetMaxHeaPla,
    dTSupRetMinEqu=dTSupRetMinHeaPla,
    tWinEqu=tWinHeaPla,
    tSupEqu=tSupHeaPla) if nHeaPla > 0
    annotation (Placement(transformation(extent={{102,-432},{122,-412}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep5(nout=
        nCooPla) if nCooPla > 0
    annotation (Placement(transformation(extent={{-18,-540},{2,-520}})));
  Buildings.Controls.OBC.CDL.Logical.And and6[nCooPla] if nCooPla > 0
    annotation (Placement(transformation(extent={{18,-550},{38,-530}})));
  BaseClasses.HeatAndCoolingRequirements cooPlaReq[nCooPla](
    equNam="cooling plant",
    durationMinEquOn=durationMinCooPlaOn,
    durationMinEquOff=durationMinCooPlaOff,
    delayTimeEqu=delayTimeCooPla,
    dTallBanEqu=dTallBanCooPla,
    TMaxEqu=TMaxCooPla,
    TMinEqu=TMinCooPla,
    dTSupRetMaxEqu=dTSupRetMaxCooPla,
    dTSupRetMinEqu=dTSupRetMinCooPla,
    tWinEqu=tWinCooPla,
    tSupEqu=tSupCooPla) if nCooPla > 0
    annotation (Placement(transformation(extent={{98,-552},{118,-532}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput yTan[nTan] if nTan > 0
    "Tanks monitor signal" annotation (Placement(transformation(extent={{-120,-670},
            {-80,-630}}), iconTransformation(extent={{-140,-598},{-100,-558}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TTanSetUpp[nTan](final unit="K",
      displayUnit="degC") if nTan > 0 "Tank upper bound setpoint temperature"
    annotation (Placement(transformation(extent={{-120,-700},{-80,-660}}),
        iconTransformation(extent={{-140,-618},{-100,-578}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TTanSetLow[nTan](final unit="K",
      displayUnit="degC") if nTan > 0 "Tank lower bound setpoint temperature"
                                            annotation (Placement(
        transformation(extent={{-120,-730},{-80,-690}}), iconTransformation(
          extent={{-140,-638},{-100,-598}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TTan[nTan,nTanLay](final unit=
       "K", displayUnit="degC") if nTan > 0 "Tank layers temperature"
    annotation (Placement(transformation(extent={{-120,-760},{-80,-720}}),
        iconTransformation(extent={{-140,-658},{-100,-618}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput mPum_flow[nPum](final unit="kg/s",
      displayUnit="kg/s") if nPum > 0 "Pump massflow rate" annotation (
      Placement(transformation(extent={{-120,-820},{-80,-780}}),
        iconTransformation(extent={{-140,-698},{-100,-658}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput dpPum[nPum](final unit="Pa",
      displayUnit="Pa") if nPum > 0 "Pump current pressure differential"
    annotation (Placement(transformation(extent={{-120,-850},{-80,-810}}),
        iconTransformation(extent={{-140,-718},{-100,-678}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput yPumCon[nPum] if nPum > 0
    "Pump control signal" annotation (Placement(transformation(extent={{-120,-880},
            {-80,-840}}), iconTransformation(extent={{-140,-738},{-100,-698}})));

  Buildings.Controls.OBC.CDL.Interfaces.RealInput yValPos[nVal] if nVal > 0
    "Valve position" annotation (Placement(transformation(extent={{-120,-940},{-80,
            -900}}), iconTransformation(extent={{-140,-778},{-100,-738}})));
  StableContinuousSignal reqStaVal[nVal](
    each name="valve",
    each text="This valve position must show stable operation.",
    each use_activeInput=true,
    each T=tWinVal,
    each t=tVal) if nVal > 0
    "Requirement to verify stability of valve position"
    annotation (Placement(transformation(extent={{40,-920},{60,-900}})));
  BaseClasses.ThermalEnergyStorageRequirement tanReq[nTan](
    delayTime=delayTimeTan,
    TMax=TMaxTan,
    TMin=TMinTan,
    nTanLay=nTanLay) if nTan > 0
    annotation (Placement(transformation(extent={{100,-680},{120,-660}})));
  BaseClasses.PumpRequirement pumReq[nPum](
    durationMinOn=durationMinPumOn,
    durationMinOff=durationMinPumOff,
    delayTime=delayTimePum,
    mMax_flow=mMax_flow,
    dpMax=dpPumMax,
    tWin=tWinPum,
    t=tPum) if nPum > 0
    annotation (Placement(transformation(extent={{100,-820},{120,-800}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep6(nout=nTan)
    if nTan > 0
    annotation (Placement(transformation(extent={{-20,-650},{0,-630}})));
  Buildings.Controls.OBC.CDL.Logical.And and7[nTan] if nTan > 0
    annotation (Placement(transformation(extent={{20,-660},{40,-640}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep7(nout=nTan)
    if nPum > 0
    annotation (Placement(transformation(extent={{-20,-780},{0,-760}})));
  Buildings.Controls.OBC.CDL.Logical.And and8[nTan] if nTan > 0
    annotation (Placement(transformation(extent={{20,-790},{40,-770}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booScaRep8(nout=nVal)
    if nVal > 0
    annotation (Placement(transformation(extent={{-40,-880},{-20,-860}})));
  Buildings.Controls.OBC.CDL.Logical.And and9[nTan] if nVal > 0
    annotation (Placement(transformation(extent={{0,-900},{20,-880}})));
protected
        parameter Modelica.Units.SI.Time tStart(fixed=false)
    "Start of the simulation";
initial equation
        tStart = time;
equation
  connect(booScaRep.y,and1. u1)
    annotation (Line(points={{-16,80},{-10,80},{-10,70},{-2,70}},
                                                 color={255,0,255}));
  connect(staVer.y, booScaRep.u) annotation (Line(points={{-49,80},{-40,80}},
                         color={255,0,255}));
  connect(yHeaPum,and1. u2) annotation (Line(points={{-100,80},{-78,80},{-78,62},
          {-2,62}},  color={255,0,255}));
  connect(and1.y, heaPumReq.yAct) annotation (Line(points={{22,70},{38,70},{38,80},
          {98,80}}, color={255,0,255}));
  connect(TSupHeaPum,heaPumReq.TSupEqu)  annotation (Line(points={{-100,50},{40,
          50},{40,75},{98,75}}, color={0,0,127}));
  connect(TRetHeaPum,heaPumReq.TRetEqu)  annotation (Line(points={{-100,20},{50,
          20},{50,70},{98,70}}, color={0,0,127}));
  connect(TSupSetHeaPum, heaPumReq.TSupSetEqu) annotation (Line(points={{-100,-10},
          {92,-10},{92,64},{98,64}}, color={0,0,127}));
  connect(TSupBoi,boiReq.TSupEqu)  annotation (Line(points={{-100,-70},{72,-70},
          {72,-49},{80,-49}}, color={0,0,127}));
  connect(booScaRep1.y, and2.u1) annotation (Line(points={{-16,-38},{-10,-38},{-10,
          -48},{-2,-48}}, color={255,0,255}));
  connect(and2.y,boiReq. yAct) annotation (Line(points={{22,-48},{68,-48},{68,-44},
          {80,-44}}, color={255,0,255}));
  connect(staVer.y, booScaRep1.u) annotation (Line(points={{-49,80},{-46,80},{-46,
          74},{-44,74},{-44,-32},{-46,-32},{-46,-38},{-40,-38}}, color={255,0,255}));
  connect(yBoi, and2.u2) annotation (Line(points={{-100,-40},{-48,-40},{-48,-56},
          {-2,-56}}, color={255,0,255}));
  connect(TRetBoi,boiReq.TRetEqu)  annotation (Line(points={{-100,-100},{74,-100},
          {74,-54},{80,-54}}, color={0,0,127}));
  connect(TSetBoi,boiReq. TSupSetEqu) annotation (Line(points={{-100,-130},{-30,
          -130},{-30,-102},{80,-102},{80,-60}}, color={0,0,127}));
  connect(TsupChi,chiReq.TSupEqu)  annotation (Line(points={{-100,-200},{68,-200},
          {68,-179},{80,-179}},color={0,0,127}));
  connect(TRetChi,chiReq.TRetEqu)  annotation (Line(points={{-100,-230},{74,-230},
          {74,-184},{80,-184}},  color={0,0,127}));
  connect(TSetChi,chiReq. TSupSetEqu) annotation (Line(points={{-100,-260},{-70,
          -260},{-70,-202},{72,-202},{72,-190},{80,-190}},
                      color={0,0,127}));
  connect(staVer.y, booScaRep2.u) annotation (Line(points={{-49,80},{-48,80},{-48,
          -170},{-36,-170}}, color={255,0,255}));
  connect(booScaRep2.y, and3.u1) annotation (Line(points={{-12,-170},{-8,-170},{
          -8,-182},{0,-182}}, color={255,0,255}));
  connect(yChi, and3.u2) annotation (Line(points={{-100,-166},{-50,-166},{-50,-190},
          {0,-190}}, color={255,0,255}));
  connect(and3.y,chiReq. yAct) annotation (Line(points={{24,-182},{54,-182},{54,
          -174},{80,-174}}, color={255,0,255}));
  connect(booScaRep3.y, and4.u1) annotation (Line(points={{2,-290},{8,-290},{8,-300},
          {14,-300}}, color={255,0,255}));
  connect(yHeaChi, and4.u2) annotation (Line(points={{-100,-290},{-30,-290},{-30,
          -308},{14,-308}}, color={255,0,255}));
  connect(and4.y,heaChiReq. yAct) annotation (Line(points={{38,-300},{86,-300},{
          86,-294},{94,-294}}, color={255,0,255}));
  connect(TSupHeaChi,heaChiReq.TSupEqu)  annotation (Line(points={{-100,-320},{86,
          -320},{86,-302},{88,-302},{88,-299},{94,-299}}, color={0,0,127}));
  connect(TRetHeaChi,heaChiReq.TRetEqu)  annotation (Line(points={{-100,-350},{88,
          -350},{88,-304},{94,-304}}, color={0,0,127}));
  connect(TSetHeaChi,heaChiReq. TSupSetEqu) annotation (Line(points={{-100,-380},
          {94,-380},{94,-310}}, color={0,0,127}));
  connect(staVer.y, booScaRep3.u) annotation (Line(points={{-49,80},{-49,-290},{
          -22,-290}}, color={255,0,255}));
  connect(booScaRep4.y,and5. u1) annotation (Line(points={{8,-410},{14,-410},{14,
          -420},{20,-420}},
                      color={255,0,255}));
  connect(and5.y,heaPlaReq. yAct) annotation (Line(points={{44,-420},{92,-420},{
          92,-414},{100,-414}}, color={255,0,255}));
  connect(staVer.y, booScaRep4.u) annotation (Line(points={{-49,80},{-49,-290},{
          -32,-290},{-32,-410},{-16,-410}}, color={255,0,255}));
  connect(TSupHeaPla,heaPlaReq.TSupEqu)  annotation (Line(points={{-100,-440},{92,
          -440},{92,-422},{94,-422},{94,-419},{100,-419}}, color={0,0,127}));
  connect(TRetHeaPla,heaPlaReq.TRetEqu)  annotation (Line(points={{-100,-470},{94,
          -470},{94,-424},{100,-424}}, color={0,0,127}));
  connect(TSetHeaPla,heaPlaReq. TSupSetEqu) annotation (Line(points={{-100,-500},
          {100,-500},{100,-430}}, color={0,0,127}));
  connect(yHeaReq, and5.u2) annotation (Line(points={{-100,-410},{-34,-410},{-34,
          -428},{20,-428}}, color={255,0,255}));
  connect(booScaRep5.y,and6. u1) annotation (Line(points={{4,-530},{10,-530},{10,
          -540},{16,-540}},
                      color={255,0,255}));
  connect(and6.y,cooPlaReq. yAct) annotation (Line(points={{40,-540},{88,-540},{
          88,-534},{96,-534}}, color={255,0,255}));
  connect(staVer.y, booScaRep5.u) annotation (Line(points={{-49,80},{-40,80},{-40,
          -530},{-20,-530}}, color={255,0,255}));
  connect(yCooReq, and6.u2) annotation (Line(points={{-100,-530},{-44,-530},{-44,
          -548},{16,-548}}, color={255,0,255}));
  connect(TSupCooPla,cooPlaReq.TSupEqu)  annotation (Line(points={{-100,-560},{88,
          -560},{88,-542},{90,-542},{90,-539},{96,-539}}, color={0,0,127}));
  connect(TRetCooPla,cooPlaReq.TRetEqu)  annotation (Line(points={{-100,-590},{-4,
          -590},{-4,-544},{96,-544}}, color={0,0,127}));
  connect(TSetCooPla,cooPlaReq. TSupSetEqu) annotation (Line(points={{-100,-620},
          {90,-620},{90,-550},{96,-550}}, color={0,0,127}));
  connect(yValPos, reqStaVal.u) annotation (Line(points={{-100,-920},{28,-920},{
          28,-906},{39,-906}}, color={0,0,127}));
  connect(TTanSetUpp, tanReq.TSetUpp) annotation (Line(points={{-100,-680},{-74,
          -680},{-74,-669},{98,-669}},             color={0,0,127}));
  connect(TTan, tanReq.TLay) annotation (Line(points={{-100,-740},{-64,-740},{
          -64,-673},{98,-673}},                    color={0,0,127}));
  connect(TTanSetLow, tanReq.TSetLow) annotation (Line(points={{-100,-710},{-68,
          -710},{-68,-671},{98,-671}},       color={0,0,127}));
  connect(mPum_flow, pumReq.m_flow) annotation (Line(points={{-100,-800},{-60,
          -800},{-60,-809},{98,-809}}, color={0,0,127}));
  connect(yPumCon, pumReq.yCon) annotation (Line(points={{-100,-860},{-64,-860},
          {-64,-816},{96,-816},{96,-813},{98,-813}}, color={0,0,127}));
  connect(dpPum, pumReq.dp) annotation (Line(points={{-100,-830},{-74,-830},{
          -74,-811},{98,-811}}, color={0,0,127}));
  connect(booScaRep6.y, and7.u1) annotation (Line(points={{2,-640},{8,-640},{8,
          -650},{18,-650}}, color={255,0,255}));
  connect(yTan, and7.u2) annotation (Line(points={{-100,-650},{-100,-652},{-76,
          -652},{-76,-660},{12,-660},{12,-658},{18,-658}}, color={255,0,255}));
  connect(and7.y, tanReq.y) annotation (Line(points={{42,-650},{88,-650},{88,
          -664},{98,-664},{98,-667}}, color={255,0,255}));
  connect(booScaRep6.u, staVer.y) annotation (Line(points={{-22,-640},{-38,-640},
          {-38,-530},{-40,80},{-49,80}}, color={255,0,255}));
  connect(booScaRep7.y, and8.u1) annotation (Line(points={{2,-770},{4,-770},{4,
          -780},{18,-780}}, color={255,0,255}));
  connect(and8.u2, yPum) annotation (Line(points={{18,-788},{-68,-788},{-68,
          -770},{-100,-770}}, color={255,0,255}));
  connect(and8.y, pumReq.y) annotation (Line(points={{42,-780},{88,-780},{88,
          -804},{98,-804},{98,-807}}, color={255,0,255}));
  connect(booScaRep7.u, staVer.y) annotation (Line(points={{-22,-770},{-38,-770},
          {-38,-530},{-40,80},{-49,80}}, color={255,0,255}));
  connect(yVal, and9.u2) annotation (Line(points={{-100,-890},{-100,-892},{-12,
          -892},{-12,-898},{-2,-898}}, color={255,0,255}));
  connect(booScaRep8.y, and9.u1) annotation (Line(points={{-18,-870},{-12,-870},
          {-12,-890},{-2,-890}}, color={255,0,255}));
  connect(booScaRep8.u, staVer.y) annotation (Line(points={{-42,-870},{-42,-768},
          {-38,-768},{-38,-530},{-40,80},{-49,80}}, color={255,0,255}));
  connect(and9.y, reqStaVal.active) annotation (Line(points={{22,-890},{68,-890},
          {68,-928},{32,-928},{32,-914},{38,-914}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-960},
            {260,140}}), graphics={
        Rectangle(
          extent={{-100,142},{260,-960}},
          lineColor={0,0,0},
          lineThickness=5.0,
          fillColor={235,235,235},
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised,
          radius=0),
        Text(
          extent={{8,238},{136,110}},
          textString="%name",
          textColor={0,0,255})}),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-960},{260,140}})),
    experiment(
      StopTime=7200,
      Interval=1,
      __Dymola_Algorithm="Dassl"),
    Documentation(revisions="<html>
<li>
August 20, 2025, by Ettore Zanetti:<br/>
First implementation.
</li>
</html>"));
end PlantRequirement;
