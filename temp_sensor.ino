//Initializes pin that the thermistor will be connected to;
int thermistorPin = A0;
double thermistorReading;
double tempK;
double tempC;
double tempF;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  
  thermistorReading = analogRead(thermistorPin);

  tempK = log(10000.0 / ((1024.0 / thermistorReading - 1)));
  tempK = 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * tempK * tempK)) * tempK);
  tempC = tempK - 273.15;
  tempF = ((tempC * 9.0) / 5.0 + 32.0);
  Serial.println(tempF);
}
