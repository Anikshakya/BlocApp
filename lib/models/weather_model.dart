import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  dynamic location;
  dynamic current;

  WeatherModel({
    this.location,
    this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: json["location"] != null ? Location.fromJson(json["location"]) : null,
    current: json["current"] != null ? Current.fromJson(json["current"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson() ?? {},
    "current": current?.toJson() ?? {},
  };
}

class Current {
  dynamic lastUpdatedEpoch;
  dynamic lastUpdated;
  dynamic tempC;
  dynamic tempF;
  dynamic isDay;
  dynamic condition;
  dynamic windMph;
  dynamic windKph;
  dynamic windDegree;
  dynamic windDir;
  dynamic pressureMb;
  dynamic pressureIn;
  dynamic precipMm;
  dynamic precipIn;
  dynamic humidity;
  dynamic cloud;
  dynamic feelslikeC;
  dynamic feelslikeF;
  dynamic windchillC;
  dynamic windchillF;
  dynamic heatindexC;
  dynamic heatindexF;
  dynamic dewpointC;
  dynamic dewpointF;
  dynamic visKm;
  dynamic visMiles;
  dynamic uv;
  dynamic gustMph;
  dynamic gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: json["last_updated_epoch"],
    lastUpdated: json["last_updated"],
    tempC: json["temp_c"],
    tempF: json["temp_f"],
    isDay: json["is_day"],
    condition: json["condition"] != null ? Condition.fromJson(json["condition"]) : null,
    windMph: json["wind_mph"],
    windKph: json["wind_kph"],
    windDegree: json["wind_degree"],
    windDir: json["wind_dir"],
    pressureMb: json["pressure_mb"],
    pressureIn: json["pressure_in"],
    precipMm: json["precip_mm"],
    precipIn: json["precip_in"],
    humidity: json["humidity"],
    cloud: json["cloud"],
    feelslikeC: json["feelslike_c"],
    feelslikeF: json["feelslike_f"],
    windchillC: json["windchill_c"],
    windchillF: json["windchill_f"],
    heatindexC: json["heatindex_c"],
    heatindexF: json["heatindex_f"],
    dewpointC: json["dewpoint_c"],
    dewpointF: json["dewpoint_f"],
    visKm: json["vis_km"],
    visMiles: json["vis_miles"],
    uv: json["uv"],
    gustMph: json["gust_mph"],
    gustKph: json["gust_kph"],
  );

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition?.toJson() ?? {},
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "windchill_c": windchillC,
    "windchill_f": windchillF,
    "heatindex_c": heatindexC,
    "heatindex_f": heatindexF,
    "dewpoint_c": dewpointC,
    "dewpoint_f": dewpointF,
    "vis_km": visKm,
    "vis_miles": visMiles,
    "uv": uv,
    "gust_mph": gustMph,
    "gust_kph": gustKph,
  };
}

class Condition {
  dynamic text;
  dynamic icon;
  dynamic code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}

class Location {
  dynamic name;
  dynamic region;
  dynamic country;
  dynamic lat;
  dynamic lon;
  dynamic tzId;
  dynamic localtimeEpoch;
  dynamic localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: json["lat"],
    lon: json["lon"],
    tzId: json["tz_id"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}
