within Buildings_Requirements.BaseClasses;
block ThermalEnergyStorageRequirement
  "This block is used to defined common requirements across thermal energy storage"
  parameter Modelica.Units.SI.Time delayTime(displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true";
    parameter Integer nTanLay=1
    "Number of tank temperature layers to check"
    annotation (Evaluate=true);
     parameter Real TMax(
    final unit="K",
    each displayUnit="K") = 273.15 + 65
    "Maximum allowed tank temperature";
    parameter Real TMin(
    final unit="K",
    displayUnit="K") = 273.15 + 2
    "Minimum allowed tank temperature";
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput y
    "Tanks monitor signal" annotation (Placement(transformation(extent={{-140,40},
            {-100,80}}), iconTransformation(extent={{-140,10},{-100,50}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSetUpp(final unit="K",
      displayUnit="degC") "Tank upper bound setpoint temperature" annotation (
      Placement(transformation(extent={{-140,10},{-100,50}}),iconTransformation(
          extent={{-140,-10},{-100,30}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSetLow(final unit="K",
      displayUnit="degC") "Tank lower bound setpoint temperature" annotation (
      Placement(transformation(extent={{-140,-30},{-100,10}}),
        iconTransformation(extent={{-140,-30},{-100,10}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TLay[nTanLay](final unit="K",
      displayUnit="degC") "Tank layers temperature" annotation (Placement(
        transformation(extent={{-140,-50},{-100,-10}}), iconTransformation(
          extent={{-140,-50},{-100,-10}})));
  GreaterEqual greTMax(
    name="tank",
    text="This tank maxmimum temperature is above the threshold " + String(
         TMax) + "K.",
    use_activeInput=false)
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  GreaterEqual greTMin(
    name="tank",
    text="This tank minimum temperature is below the threshold " + String(
        TMin) + "K",
    use_activeInput=false)
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  GreaterEqual greTUpp(
    name="tank",
    text="This tank average temperature is above the upper bound once the equipement is active for "
         + String(delayTime/60) + " minutes.",
    use_activeInput=true,
    delayTime=delayTime,
    tThr=tThr)
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  GreaterEqual greTLow(
    name="tank",
    text="This tank average temperature is below the lower bound once the equipement is active for "
         + String(delayTime/60) + " minutes.",
    use_activeInput=true,
    delayTime=delayTime,
    tThr=tThr)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Math.MultiSum multiSum(k=fill(1/nTanLay, nTanLay),
                                         nu=nTanLay)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Math.MinMax minMax(nu=nTanLay)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Sources.Constant TLayMax(each k=TMax)
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Sources.Constant TLayMin(each k=TMin)
    annotation (Placement(transformation(extent={{0,-90},{20,-70}})));
  parameter Real tThr=600
    "Threshold time for constraint to be considered violated";
equation
  connect(y,greTUpp. active) annotation (Line(points={{-120,60},{-34,60},{
          -34,66},{-22,66}},                         color={255,0,255}));
  connect(y,greTLow. active) annotation (Line(points={{-120,60},{-34,60},{
          -34,48},{20,48},{20,66},{38,66}},          color={255,0,255}));
  connect(TSetUpp,greTUpp. u_max) annotation (Line(points={{-120,30},{-80,
          30},{-80,76},{-21,76}},                        color={0,0,127}));
  connect(TSetLow,greTLow. u_min) annotation (Line(points={{-120,-10},{-28,
          -10},{-28,54},{18,54},{18,72},{39,72}},          color={0,0,127}));
  connect(TLay, minMax.u) annotation (Line(points={{-120,-30},{-50,-30},{-50,-50},
          {-40,-50}}, color={0,0,127}));
  connect(TLay, multiSum.u) annotation (Line(points={{-120,-30},{-70,-30},{-70,
          30},{-60,30}}, color={0,0,127}));
  connect(multiSum.y, greTLow.u_max) annotation (Line(points={{-38.3,30},{-30,
          30},{-30,90},{36,90},{36,76},{39,76}}, color={0,0,127}));
  connect(minMax.yMax, greTMax.u_min) annotation (Line(points={{-19,-44},{34,
          -44},{34,-28},{39,-28}}, color={0,0,127}));
  connect(minMax.yMin, greTMin.u_max) annotation (Line(points={{-19,-56},{34,
          -56},{34,-64},{39,-64}}, color={0,0,127}));
  connect(multiSum.y, greTUpp.u_min) annotation (Line(points={{-38.3,30},{-30,
          30},{-30,72},{-21,72}}, color={0,0,127}));
  connect(TLayMax.y, greTMax.u_max) annotation (Line(points={{21,-10},{34,-10},
          {34,-24},{39,-24}}, color={0,0,127}));
  connect(TLayMin.y, greTMin.u_min) annotation (Line(points={{21,-80},{34,-80},
          {34,-68},{39,-68}}, color={0,0,127}));
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
end ThermalEnergyStorageRequirement;
