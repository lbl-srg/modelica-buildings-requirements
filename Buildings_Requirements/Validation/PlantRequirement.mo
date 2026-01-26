within Buildings_Requirements.Validation;
model PlantRequirement "Example block for plant requirements model"
  extends Modelica.Icons.Example;
  inner Modelica_Requirements.Verify.PrintViolations printViolations
    "Prints requirements violations"
    annotation (Placement(transformation(extent={{120,60},{140,80}})));
  Buildings_Requirements.PlantRequirement plantRequirement(
    nHeaPum=nHeaPum,
    durationMinHeaPumOff=960,
    nBoi=nHeaPum,
    durationMinBoiOff=960,
    nChi=nHeaPum,
    durationMinChiOff=960,
    nHeaChi=nHeaPum,
    durationMinHeaChiOff=960,
    nHeaPla=nHeaPum,
    durationMinHeaPlaOff=960,
    nCooPla=nHeaPum,
    durationMinCooPlaOff=960,
    nTan=nHeaPum,
    nTanLay=2,
    nPum=2,
    durationMinPumOff=120,
    nVal=2) annotation (Placement(transformation(extent={{62,-54},{98,56}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse HPbooPul[nHeaPum](width=0.5,
      period={7200,1800})
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  parameter Integer nHeaPum=2 "Number of heat pumps to check" annotation(Evaluate=true);
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin TSupHeaPum[nHeaPum](
    amplitude={2,28},
    freqHz={1/3600,1/30},
    offset={273.15 + 55,273.15 + 37.5})
    annotation (Placement(transformation(extent={{-20,70},{0,90}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin TRetHeaPum[nHeaPum](
    amplitude={2,28},
    freqHz={1/3600,1/30},
    offset={273.15 + 50,273.15 + 37.5})
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin TSupSetHeaPum[nHeaPum](
    amplitude=2,
    freqHz={1/3600,1/30},
    offset=273.15 + 55,
    startTime=60)
    annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin TTan[2,2](
    amplitude={{2,28},{2,40}},
    freqHz={{1/3600,1/30},{1/3600,1/30}},
    offset={{273.15 + 10,273.15 + 37.5},{273.15 + 10,273.15 + 30}})
    annotation (Placement(transformation(extent={{-120,-50},{-100,-30}})));
  Modelica.Blocks.Sources.Constant TTanSetUpp[nHeaPum](k={273.15 + 65,273.15 + 40})
    annotation (Placement(transformation(extent={{-120,18},{-100,38}})));
  Modelica.Blocks.Sources.Constant TTanSetLow[nHeaPum](k={273.15 + 10,273.15 +
        40})
    annotation (Placement(transformation(extent={{-120,-20},{-100,0}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse PumbooPul
                                                           [nHeaPum](width=0.5,
      period={1200,200})
    annotation (Placement(transformation(extent={{-122,-80},{-102,-60}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin mFloPum[nHeaPum](
    amplitude={3,6},
    freqHz={1/1800,1},
    offset={5,4})
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin dpPum[nHeaPum](
    amplitude={4000,6000},
    freqHz={1/1800,1},
    offset={5000,4000})
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin yPum[nHeaPum](
    amplitude={0.5,1},
    freqHz={1/1800,1},
    offset={0.5,0.5})
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
equation
  connect(plantRequirement.TSupHeaPum, TSupHeaPum.y) annotation (Line(points={{60,30.2},
          {12,30.2},{12,80},{2,80}},       color={0,0,127}));
  connect(TRetHeaPum.y, plantRequirement.TRetHeaPum) annotation (Line(points={{-38,80},
          {-30,80},{-30,28.2},{60,28.2}},     color={0,0,127}));
  connect(TSupSetHeaPum.y, plantRequirement.TSupSetHeaPum) annotation (Line(
        points={{-78,80},{-70,80},{-70,26.2},{60,26.2}}, color={0,0,127}));
  connect(HPbooPul.y, plantRequirement.yHeaPum) annotation (Line(points={{42,80},
          {52,80},{52,32.2},{60,32.2}}, color={255,0,255}));
  connect(HPbooPul.y, plantRequirement.yBoi) annotation (Line(points={{42,80},{
          52,80},{52,24.2},{60,24.2}},
                                    color={255,0,255}));
  connect(TSupHeaPum.y, plantRequirement.TSupBoi) annotation (Line(points={{2,80},{
          12,80},{12,30},{44,30},{44,22.2},{60,22.2}},  color={0,0,127}));
  connect(TRetHeaPum.y, plantRequirement.TRetBoi) annotation (Line(points={{-38,80},
          {-30,80},{-30,28},{42,28},{42,20.2},{60,20.2}},     color={0,0,127}));
  connect(TSupSetHeaPum.y, plantRequirement.TSetBoi) annotation (Line(points={{-78,80},
          {-70,80},{-70,26},{40,26},{40,18.2},{60,18.2}},     color={0,0,127}));
  connect(HPbooPul.y, plantRequirement.yChi) annotation (Line(points={{42,80},{
          52,80},{52,16.2},{60,16.2}},
                                    color={255,0,255}));
  connect(TSupHeaPum.y, plantRequirement.TsupChi) annotation (Line(points={{2,80},{
          12,80},{12,14.2},{60,14.2}},  color={0,0,127}));
  connect(TRetHeaPum.y, plantRequirement.TRetChi) annotation (Line(points={{-38,80},
          {-30,80},{-30,12},{22,12},{22,12.2},{60,12.2}},     color={0,0,127}));
  connect(TSupSetHeaPum.y, plantRequirement.TSetChi) annotation (Line(points={{-78,80},
          {-70,80},{-70,10.2},{60,10.2}},     color={0,0,127}));
  connect(plantRequirement.yHeaChi, HPbooPul.y) annotation (Line(points={{60,8.2},
          {52,8.2},{52,80},{42,80}}, color={255,0,255}));
  connect(plantRequirement.yHeaReq, HPbooPul.y) annotation (Line(points={{60,0.2},
          {52,0.2},{52,80},{42,80}}, color={255,0,255}));
  connect(plantRequirement.yCooReq, HPbooPul.y) annotation (Line(points={{60,-7.8},
          {52,-7.8},{52,80},{42,80}}, color={255,0,255}));
  connect(plantRequirement.TSupHeaChi, TSupHeaPum.y) annotation (Line(points={{60,6.2},
          {36,6.2},{36,6},{12,6},{12,80},{2,80}},      color={0,0,127}));
  connect(plantRequirement.TRetHeaChi, TRetHeaPum.y) annotation (Line(points={{60,4.2},
          {-30,4.2},{-30,80},{-38,80}},      color={0,0,127}));
  connect(plantRequirement.TSetHeaChi, TSupSetHeaPum.y) annotation (Line(points={{60,2.2},
          {-70,2.2},{-70,80},{-78,80}},          color={0,0,127}));
  connect(plantRequirement.TSupHeaPla, TSupHeaPum.y) annotation (Line(points={{60,-1.8},
          {12,-1.8},{12,80},{2,80}},       color={0,0,127}));
  connect(plantRequirement.TRetHeaPla, TRetHeaPum.y) annotation (Line(points={{60,-3.8},
          {-30,-3.8},{-30,80},{-38,80}},       color={0,0,127}));
  connect(plantRequirement.TSetHeaPla, TSupSetHeaPum.y) annotation (Line(points={{60,-5.8},
          {-70,-5.8},{-70,80},{-78,80}},           color={0,0,127}));
  connect(plantRequirement.TSupCooPla, TSupHeaPum.y) annotation (Line(points={{60,-9.8},
          {12,-9.8},{12,80},{2,80}},       color={0,0,127}));
  connect(plantRequirement.TRetCooPla, TRetHeaPum.y) annotation (Line(points={{60,
          -11.8},{16,-11.8},{16,-12},{-30,-12},{-30,80},{-38,80}}, color={0,0,127}));
  connect(plantRequirement.TSetCooPla, TSupSetHeaPum.y) annotation (Line(points={{60,
          -13.8},{28,-13.8},{28,-14},{-70,-14},{-70,80},{-78,80}},     color={0,
          0,127}));
  connect(HPbooPul.y, plantRequirement.yTan) annotation (Line(points={{42,80},{
          56,80},{56,-15.8},{60,-15.8}},
                                      color={255,0,255}));
  connect(TTanSetUpp.y, plantRequirement.TTanSetUpp) annotation (Line(points={{-99,28},
          {-90,28},{-90,26},{-80,26},{-80,-17.8},{60,-17.8}},     color={0,0,127}));
  connect(TTanSetLow.y, plantRequirement.TTanSetLow) annotation (Line(points={{-99,-10},
          {-94,-10},{-94,-12},{-88,-12},{-88,-19.8},{60,-19.8}},      color={0,0,
          127}));
  connect(TTan.y, plantRequirement.TTan) annotation (Line(points={{-98,-40},{
          -94,-40},{-94,-21.8},{60,-21.8}},
                                       color={0,0,127}));
  connect(PumbooPul.y, plantRequirement.yPum) annotation (Line(points={{-100,
          -70},{50,-70},{50,-23.8},{60,-23.8}}, color={255,0,255}));
  connect(PumbooPul.y, plantRequirement.yVal) annotation (Line(points={{-100,
          -70},{50,-70},{50,-31.8},{60,-31.8}}, color={255,0,255}));
  connect(mFloPum.y, plantRequirement.mPum_flow) annotation (Line(points={{-58,
          -40},{-58,-25.8},{60,-25.8}}, color={0,0,127}));
  connect(dpPum.y, plantRequirement.dpPum) annotation (Line(points={{-18,-40},{
          -14,-40},{-14,-27.8},{60,-27.8}}, color={0,0,127}));
  connect(yPum.y, plantRequirement.yPumCon) annotation (Line(points={{22,-50},{
          52,-50},{52,-29.8},{60,-29.8}}, color={0,0,127}));
  connect(yPum.y, plantRequirement.yValPos) annotation (Line(points={{22,-50},{
          52,-50},{52,-33.8},{60,-33.8}}, color={0,0,127}));
  annotation (experiment(
      StopTime=14400,
      Interval=10,
      Tolerance=1e-06,
      __Dymola_Algorithm="Cvode"),
      __Dymola_Commands(file=
          "modelica://Buildings_Requirements/Resources/Scripts/Dymola/Requirements/Validation/WithinBand.mos"
        "Simulate and plot"),
  Documentation(info="<html>
<p>
Model that validates the correct operation of a heating and cooling plant.
</p>
</html>", revisions="<html>
<ul>
<li>
September 2, 2025, by Ettore Zanetti:<br/>
First implementation.
</li>
</html>"),
    Diagram(coordinateSystem(extent={{-160,-100},{160,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end PlantRequirement;
