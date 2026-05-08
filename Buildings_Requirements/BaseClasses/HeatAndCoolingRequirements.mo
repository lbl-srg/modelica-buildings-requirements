within Buildings_Requirements.BaseClasses;
block HeatAndCoolingRequirements
  "This partial block is used to defined common requirements across heating and cooling equipement, such as heat pumps, chillers, and boilers"
  parameter String equNam = "Equipement name";
  parameter Modelica.Units.SI.Time durationMinEquOn(displayUnit="min") = 1800
    "Minimum duration equipement must remain on";
  parameter Modelica.Units.SI.Time durationMinEquOff(displayUnit="min") = 600
    "Minimum duration equipement must remain off";
  parameter Modelica.Units.SI.Time delayTimeEqu(displayUnit="min") = 600
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true";
  parameter Real dTallBanEqu(
    final unit="K",
    displayUnit="K") = 1 "Allowable error band when tracking setpoint";
  parameter Real TMaxEqu(
    final unit="K",
    displayUnit="K") = 273.15 + 65
    "Maximum allowed equipement supply temperature";
  parameter Real TMinEqu(
    final unit="K",
    displayUnit="K") = 273.15 + 10 "Minimum equipement supply temperature";
  parameter Real dTSupRetMaxEqu(
    final unit="K",
    displayUnit="K") = 20
    "Maximum difference between equipement supply and return temperatures";
  parameter Real dTSupRetMinEqu(
    final unit="K",
    displayUnit="K") = 4 "Minimum ";
  parameter Modelica.Units.SI.Time tWinEqu=360
    "Length of sliding time window for equipement supply temperature in seconds";
  parameter Real tSupEqu=0.05
    "Average equipement supply temperature speed during the sliding window above which the signal is deemed as unstable";

  MinimumDuration reqEquOn(
    name=equNam,
    text="This " + equNam + " must operate at least " + String(
        durationMinEquOn/60) + " min when activated.",
    durationMin(displayUnit="s") = durationMinEquOn)
    "Requirement for equipement on"
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  MinimumDuration reqEquOff(
    name=equNam,
    text="This " + equNam + " must remain off at least " + String(
        durationMinEquOff/60) + " min when activated.",
    durationMin(displayUnit="min") = durationMinEquOff)
    "Requirement for equipement off"
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Buildings.Controls.OBC.CDL.Logical.Not not1
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  WithinBand reqTSupSetEqu(
    name=equNam,
    text="This " + equNam +
        " supply temperature set point must be tracked within ± " + String(
        dTallBanEqu/2) + "K once the equipement is active for " + String(
        delayTimeEqu/60) + " min.",
    use_activeInput=true,
    delayTime(displayUnit="min") = delayTimeEqu,
    tThr=tThr,
    u_max(
      final unit="K",
      displayUnit="K") = dTallBanEqu/2,
    u_min(
      final unit="K",
      displayUnit="K") = -dTallBanEqu/2,
    u(final unit="K", displayUnit="K"),
    witBan(u(final unit="K")))
    "Requirement for tracking the equipement supply temperature"
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  StableContinuousSignal reqStaEqu(
    name=equNam,
    text="This " + equNam + " supply temperature must show stable operation",
    use_activeInput=true,
    tThr=tThr,
    T=tWinEqu,
    t=tSupEqu)
    "Requirement to verify stability of equipement supply temperature"
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Buildings.Controls.OBC.CDL.Reals.Subtract sub
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Buildings.Controls.OBC.CDL.Reals.Subtract sub1
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  WithinBand reqdTSupRetEqu(
    name=equNam,
    text="This " + equNam +
        " supply and return temperature difference should be between " + String(
        dTSupRetMinEqu) + "K and " + String(dTSupRetMaxEqu) +
        "K once the equipement is active for " + String(delayTimeEqu/60) +
        " min.",
    use_activeInput=true,
    delayTime(displayUnit="min") = delayTimeEqu,
    tThr=tThr,
    u_max(
      final unit="K",
      displayUnit="K") = dTSupRetMaxEqu,
    u_min(
      final unit="K",
      displayUnit="K") = dTSupRetMinEqu,
    u(final unit="K", displayUnit="K"),
    witBan(u(final unit="K")))
    "Requirement for tracking the equipement difference between supply and return temperatures"
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  WithinBand reqTSupLimEqu(
    name=equNam,
    text="This " + equNam + " supply temperature must be between " +
        String(TMinEqu) + " K and " + String(TMaxEqu) + " K once the equipement has been active for "
         + String(delayTimeEqu/60/10) + " min.",
    use_activeInput=true,
    delayTime(displayUnit="min") = delayTimeEqu/10,
    u_max(
      final unit="K",
      displayUnit="K") = TMaxEqu,
    u_min(
      final unit="K",
      displayUnit="K") = TMinEqu,
    u(final unit="K", displayUnit="K"),
    witBan(u(final unit="K")))
    "Requirement for checking maximum and minimum equipement supply temperature"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Buildings.Controls.OBC.CDL.Reals.Abs abs1
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  WithinBand reqTRetLimEqu(
    name=equNam,
    text="This " + equNam + " return temperature must be between " +
        String(TMinEqu) + " K and " + String(TMaxEqu) + " K once the equipement has been active for "
         + String(delayTimeEqu/60/10) + " min.",
    use_activeInput=true,
    delayTime(displayUnit="min") = delayTimeEqu/10,
    tThr=tThr,
    u_max(
      final unit="K",
      displayUnit="K") = TMaxEqu,
    u_min(
      final unit="K",
      displayUnit="K") = TMinEqu,
    u(final unit="K", displayUnit="K"),
    witBan(u(final unit="K")))
    "Requirement for checking maximum and minimum equipement return temperature"
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput active
    " Equipment on signal" annotation (Placement(transformation(extent={{-140,
            40},{-100,80}}), iconTransformation(extent={{-140,60},{-100,100}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupEqu(
    final unit="K",
    displayUnit="degC") "Equipement supply temperature"
    annotation (Placement(transformation(extent={{-140,0},{-100,40}}),
        iconTransformation(extent={{-140,10},{-100,50}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TRetEqu(
    final unit="K",
    displayUnit="degC") "Equipement return temperature"
    annotation (Placement(transformation(extent={{-140,-40},{-100,0}}),
        iconTransformation(extent={{-140,-40},{-100,0}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupSetEqu(
    final unit="K",
    displayUnit="degC")
    "Equipement supply setpoint temperature" annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}),
                                                      iconTransformation(extent={{-140,
            -100},{-100,-60}})));
  Buildings.Controls.OBC.CDL.Reals.AddParameter addPar(p=-TMaxEqu)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Buildings.Controls.OBC.CDL.Reals.MultiplyByParameter gai(k=-1/(TMaxEqu -
        TMinEqu))
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  parameter Real tThr=600
    "Threshold time for constraint to be considered violated";
equation
  connect(TSupSetEqu, sub.u2) annotation (Line(points={{-120,-60},{-90,-60},{
          -90,4},{-42,4}},   color={0,0,127}));
  connect(sub.y, reqTSupSetEqu.u) annotation (Line(points={{-18,10},{54,10},{54,
          14},{59,14}},       color={0,0,127}));
  connect(TSupEqu, sub1.u1) annotation (Line(points={{-120,20},{-80,20},{-80,
          -44},{-42,-44}},
                         color={0,0,127}));
  connect(TRetEqu, sub1.u2) annotation (Line(points={{-120,-20},{-60,-20},{-60,
          -56},{-42,-56}},
                       color={0,0,127}));
  connect(sub1.y, abs1.u)
    annotation (Line(points={{-18,-50},{-2,-50}},color={0,0,127}));
  connect(abs1.y, reqdTSupRetEqu.u) annotation (Line(points={{22,-50},{54,-50},
          {54,-46},{59,-46}},
                            color={0,0,127}));
  connect(TSupEqu, reqTSupLimEqu.u) annotation (Line(points={{-120,20},{-80,20},
          {-80,92},{50,92},{50,74},{59,74}},                       color={0,0,127}));
  connect(TRetEqu, reqTRetLimEqu.u) annotation (Line(points={{-120,-20},{54,-20},
          {54,-16},{59,-16}},                                    color={0,0,127}));
  connect(not1.y, reqEquOff.u)
    annotation (Line(points={{2,70},{18,70}},   color={255,0,255}));
  connect(active, reqEquOn.u) annotation (Line(points={{-120,60},{-66,60},{-66,
          70},{-62,70}}, color={255,0,255}));
  connect(active, not1.u) annotation (Line(points={{-120,60},{-66,60},{-66,56},
          {-30,56},{-30,70},{-22,70}}, color={255,0,255}));
  connect(active, reqTSupSetEqu.active) annotation (Line(points={{-120,60},{-66,
          60},{-66,56},{50,56},{50,6},{58,6}}, color={255,0,255}));
  connect(active, reqStaEqu.active) annotation (Line(points={{-120,60},{-66,60},
          {-66,56},{50,56},{50,36},{58,36}}, color={255,0,255}));
  connect(active, reqTSupLimEqu.active) annotation (Line(points={{-120,60},{-66,
          60},{-66,56},{50,56},{50,66},{58,66}}, color={255,0,255}));
  connect(addPar.y, gai.u)
    annotation (Line(points={{-18,40},{-2,40}},          color={0,0,127}));
  connect(gai.y, reqStaEqu.u) annotation (Line(points={{22,40},{54,40},{54,44},
          {59,44}},            color={0,0,127}));
  connect(TSupEqu, addPar.u) annotation (Line(points={{-120,20},{-80,20},{-80,
          40},{-42,40}},
                    color={0,0,127}));
  connect(active, reqdTSupRetEqu.active) annotation (Line(points={{-120,60},{
          -66,60},{-66,56},{50,56},{50,-54},{58,-54}}, color={255,0,255}));
  connect(reqTRetLimEqu.active, active) annotation (Line(points={{58,-24},{50,
          -24},{50,56},{-66,56},{-66,60},{-120,60}}, color={255,0,255}));
  connect(TSupEqu, sub.u1) annotation (Line(points={{-120,20},{-50,20},{-50,16},
          {-42,16}}, color={0,0,127}));
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
end HeatAndCoolingRequirements;
