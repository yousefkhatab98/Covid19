class Country {
  String _country;
  String _slug;
  String _iso2;

  Country(this._country, this._slug, this._iso2);

  String get country {
    return _country;
  }

  set country(String country) {
    _country = country;
  }

  String get slug {
    return _slug;
  }

  set slug(String slug) {
    _slug = slug;
  }

  String get iso2 {
    return _iso2;
  }

  set iso2(String iso2) {
    _iso2 = iso2;
  }
}
