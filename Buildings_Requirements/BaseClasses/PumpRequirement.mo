within Buildings_Requirements.BaseClasses;
block PumpRequirement
    parameter Modelica.Units.SI.Time durationMinOn(displayUnit="min") = 300
    "Minimum duration pumps must remain on";
    parameter Modelica.Units.SI.Time durationMinOff(displayUnit="min") = 60
    "Minimum duration pumps must remain off";

    parameter Modelica.Units.SI.Time delayTime(displayUnit="min") = 60  "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true";
    parameter Modelica.Units.SI.MassFlowRate mMax_flow = 10 "Maximum mass flow rate allowed in the pump";
    parameter Modelica.Units.SI.PressureDifference dpMax(displayUnit="Pa") = 10000 "Maximum pressure difference across pump";
    parameter Modelica.Units.SI.Time tWin=120
     "Length of sliding time window for pump control signal in seconds";
    parameter Real t=0.05
    "Average pump control signal speed during the sliding window above which the signal is deemed as unstable";

   MinimumDuration reqOn(
    name="pump",
    text="This pump must operate at least " + String(durationMinOn/60) + " min when activated.",
    durationMin(displayUnit="min") = durationMinOn)
    "Requirement for pumps on"
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  MinimumDuration reqOff(
    name="pump",
    text="This pump must remain off at least " + String(durationMinOff/60)
         + " min when activated.",
    durationMin(displayUnit="min") = durationMinOff)
    "Requirement for pumps off"
    annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Buildings.Controls.OBC.CDL.Logical.Not not1
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  WithinBand reqmFlow(
    name="pump",
    text="This pump mass flow rate must be between 0 and " + String(
        mMax_flow) + " kg/s once the equipement has been active for " + String(
        delayTime/60) + " minutes.",
    use_activeInput=true,
    delayTime(displayUnit="min") = delayTime,
    u_max(
      final unit="kg/s",
      displayUnit="kg/s") = mMax_flow,
    u_min(
      final unit="kg/s",
      displayUnit="kg/s") = -mMax_flow/10000,
    u(final unit="kg/s", displayUnit="kg/s"),
    witBan(u(final unit="kg/s")))
    "Requirement for checking maximum and minimum pump flow rate"
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  WithinBand reqDp(
    name="pump",
    text="This pump pressure difference must be between 0 and " + String(
        dpMax) + " Pa once the equipement has been active for " + String(
        delayTime/60) + " minutes.",
    use_activeInput=true,
    delayTime(displayUnit="min") = delayTime,
    u_max(
      final unit="Pa",
      displayUnit="Pa") = dpMax,
    u_min(
      final unit="Pa",
      displayUnit="Pa") = -dpMax/100000,
    u(final unit="Pa", displayUnit="Pa"),
    witBan(u(final unit="Pa")))
    "Requirement for checking maximum and minimum pump pressure difference"
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  StableContinuousSignal reqSta(
    name="pump",
    text="This pump conrol signal must show stable operation.",
    use_activeInput=true,
    tThr=tThr,
    T=tWin,
    t=t) "Requirement to verify stability of pump control signal"
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput y
    "Pumps on signal" annotation (Placement(transformation(extent={{-140,20},{-100,
            60}}),  iconTransformation(extent={{-140,10},{-100,50}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput m_flow(final unit="kg/s",
      displayUnit="kg/s")             "Pump massflow rate" annotation (
      Placement(transformation(extent={{-140,-10},{-100,30}}),
        iconTransformation(extent={{-140,-10},{-100,30}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput dp(final unit="Pa",
      displayUnit="Pa")             "Pump current pressure differential"
    annotation (Placement(transformation(extent={{-140,-40},{-100,0}}),
        iconTransformation(extent={{-140,-30},{-100,10}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput yCon
    "Pump control signal" annotation (Placement(transformation(extent={{-140,-70},
            {-100,-30}}), iconTransformation(extent={{-140,-50},{-100,-10}})));
  parameter Real tThr=600
    "Threshold time for constraint to be considered violated";
equation
  connect(not1.y, reqOff.u)
    annotation (Line(points={{42,50},{58,50}}, color={255,0,255}));
  connect(y, reqOn.u) annotation (Line(points={{-120,40},{-70,40},{-70,50},{-62,
          50}}, color={255,0,255}));
  connect(y,not1. u) annotation (Line(points={{-120,40},{-70,40},{-70,66},{8,
          66},{8,50},{18,50}},            color={255,0,255}));
  connect(y, reqmFlow.active) annotation (Line(points={{-120,40},{-96,40},{-96,
          6},{-82,6}}, color={255,0,255}));
  connect(m_flow, reqmFlow.u) annotation (Line(points={{-120,10},{-90,10},{-90,
          14},{-81,14}}, color={0,0,127}));
  connect(dp, reqDp.u) annotation (Line(points={{-120,-20},{-24,-20},{-24,10},
          {30,10},{30,14},{39,14}}, color={0,0,127}));
  connect(y, reqDp.active) annotation (Line(points={{-120,40},{-70,40},{-70,66},
          {8,66},{8,6},{38,6}}, color={255,0,255}));
  connect(y, reqSta.active) annotation (Line(points={{-120,40},{-96,40},{-96,
          6},{-90,6},{-90,-34},{-22,-34}}, color={255,0,255}));
  connect(yCon, reqSta.u) annotation (Line(points={{-120,-50},{-30,-50},{-30,
          -26},{-21,-26}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=5.0,
          fillColor={235,235,235},
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised,
          radius=0),
        Text(
          extent={{-156,148},{144,108}},
          textString="%name",
          textColor={0,0,255})}),
                       Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PumpRequirement;
