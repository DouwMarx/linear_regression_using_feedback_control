within LinearRegressionUsingFeedbackControl;

model linear_model_1d "Try to optimise linear model using PID control"
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constantForBias(k = 1) annotation(Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Blocks.Math.Product product4 annotation(Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Blocks.Continuous.Integrator integratorB1(k = 1) annotation(Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Blocks.Continuous.Integrator integratorW1 annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -540)));
  Modelica.Blocks.Math.Gain learningRateW1(k = -8) annotation(Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Blocks.Math.Gain learningRateB1(k = -8) annotation(Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Blocks.Sources.CombiTimeTable featuresX(tableOnFile = true, fileName = Modelica.Utilities.Files.loadResource("modelica://analogue_logistic_regression.data_import/x_data.mat"), tableName = "x", verboseExtrapolation = true, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments) annotation(Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable targetY(tableOnFile = true, fileName = Modelica.Utilities.Files.loadResource("modelica://analogue_logistic_regression.data_import/x_data.mat"), tableName = "y", verboseExtrapolation = true, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments) annotation(Placement(visible = true, transformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  Modelica.Blocks.Continuous.Filter lowPassSmoothing(f_cut = 0.5) annotation(Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs absoluteError annotation(Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  analogue_logistic_regression.trainVersusTest trainVersusTest1 annotation(Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(product1.y, add1.u1) annotation(Line(visible = true, origin = {-52.25, 23}, points = {{-6.75, 7}, {-1.75, 7}, {-1.75, -7}, {10.25, -7}}, color = {1, 37, 163}));
  connect(product2.y, add1.u2) annotation(Line(visible = true, origin = {-52.25, -3}, points = {{-6.75, -7}, {-1.75, -7}, {-1.75, 7}, {10.25, 7}}, color = {1, 37, 163}));
  connect(add1.y, feedback1.u1) annotation(Line(visible = true, origin = {-8.5, 10}, points = {{-10.5, 0}, {10.5, 0}}, color = {1, 37, 163}));
  connect(learningRateW1.u, product3.y) annotation(Line(visible = true, origin = {-9.5, 70}, points = {{-8.5, 0}, {8.5, 0}}, color = {1, 37, 163}));
  connect(learningRateW1.y, integratorW1.u) annotation(Line(visible = true, origin = {-49.5, 70}, points = {{8.5, 0}, {-8.5, 0}}, color = {1, 37, 163}));
  connect(integratorW1.y, product1.u1) annotation(Line(visible = true, origin = {-82.25, 53}, points = {{1.25, 17}, {-2.75, 17}, {-2.75, -17}, {0.25, -17}}, color = {1, 37, 163}));
  connect(product4.y, learningRateB1.u) annotation(Line(visible = true, origin = {-9.5, -50}, points = {{8.5, 0}, {-8.5, 0}}, color = {1, 37, 163}));
  connect(learningRateB1.y, integratorB1.u) annotation(Line(visible = true, origin = {-49.5, -50}, points = {{8.5, 0}, {-8.5, 0}}, color = {1, 37, 163}));
  connect(absoluteError.y, lowPassSmoothing.u) annotation(Line(visible = true, origin = {109.5, 10}, points = {{-8.5, 0}, {8.5, 0}}, color = {1, 37, 163}));
  connect(feedback1.y, trainVersusTest1.u1) annotation(Line(visible = true, points = {{-10.5, 0}, {10.5, 0}}, color = {1, 37, 163}, origin = {29.5, 10}));
  connect(product4.u2, trainVersusTest1.y1) annotation(Line(visible = true, points = {{-31, -27}, {12, -27}, {12, 27}, {7, 27}}, color = {1, 37, 163}, origin = {53, -17}));
  connect(trainVersusTest1.y1, product3.u1) annotation(Line(visible = true, origin = {53, 37}, points = {{7, -27}, {12, -27}, {12, 27}, {-31, 27}}, color = {1, 37, 163}));
  connect(featuresX.y[1], product3.u2) annotation(Line(visible = true, origin = {-26.429, 66.571}, points = {{-72.571, -36.571}, {-68.571, -36.571}, {-68.571, 23.429}, {56.429, 23.429}, {56.429, 8.429}, {48.429, 8.429}, {48.429, 9.429}}, color = {1, 37, 163}));
  connect(featuresX.y[1], product1.u2) annotation(Line(visible = true, origin = {-92.75, 27}, points = {{-6.25, 3}, {-2.25, 3}, {-2.25, -3}, {10.75, -3}}, color = {1, 37, 163}));
  connect(constantForBias.y, product4.u1) annotation(Line(visible = true, origin = {-33.085, -45.333}, points = {{-65.915, 35.333}, {-56.915, 35.333}, {-56.915, -24.667}, {63.085, -24.667}, {63.085, -10.667}, {55.085, -10.667}}, color = {1, 37, 163}));
  connect(integratorB1.y, product2.u2) annotation(Line(visible = true, origin = {-83.25, -33}, points = {{2.25, -17}, {-1.75, -17}, {-1.75, 17}, {1.25, 17}}, color = {1, 37, 163}));
  connect(constantForBias.y, product2.u1) annotation(Line(visible = true, origin = {-88.6, -6.8}, points = {{-10.4, -3.2}, {-1.4, -3.2}, {-1.4, 1.8}, {6.6, 1.8}, {6.6, 2.8}}, color = {1, 37, 163}));
  connect(targetY.y[1], feedback1.u2) annotation(Line(visible = true, origin = {-27, -42.571}, points = {{-72, -7.429}, {-68, -7.429}, {-68, -37.429}, {67, -37.429}, {67, 22.571}, {37, 22.571}, {37, 44.571}}, color = {1, 37, 163}));
  connect(feedback1.y, absoluteError.u) annotation(Line(visible = true, origin = {51.167, 3.333}, points = {{-32.167, 6.667}, {-21.167, 6.667}, {-21.167, -13.333}, {23.833, -13.333}, {23.833, 6.667}, {26.833, 6.667}}, color = {1, 37, 163}));
  annotation(experiment(StopTime = 9.75), Documentation(figures = {Figure(title = "Absolute Error", identifier = "f61d6", plots = {Plot(curves = {Curve(y = absoluteError.y, legend = "Absolute Error"), Curve(y = lowPassSmoothing.y, legend = "Smoothed Absolute Error")}, y = Axis(label = "Absolute error"))}), Figure(title = "Learning of parameters", identifier = "ad825", plots = {Plot(curves = {Curve(y = integratorB1.y, legend = "Integrator for B1"), Curve(y = integratorW1.y, legend = "integrator for W1")}, y = Axis(label = "Approximation for  model parameter"))})}), Diagram(coordinateSystem(extent = {{-130, -90}, {150, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 114, 195}, fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, 110}, {150, 150}}, textString = "%name")}));
end linear_model_1d;
