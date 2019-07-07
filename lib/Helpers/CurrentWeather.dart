class CurrentWeather{
  String _temperatura;
  String _data;
  String _tempo;
  String _diaOuNoite;
  String _cidade;
  String _humidade;
  String _velVento;
  String _horaAmanhecer;
  String _horaAnoitecer;
  String _horaAtualizacao;

  void setTemperatura(String temperatura){
    _temperatura = temperatura;
  }

  void setData(String data){
    _data = data;
  }

  void setTempo(String tempo){
    _tempo = tempo;
  }

  void setDiaOuNoite(String diaOuNoite){
    _diaOuNoite = diaOuNoite;
  }

  void setCidade(String cidade){
    _cidade = cidade;
  }

  void setHumidade(String humidade){
    _humidade = humidade;
  }

  void setVelVento(String velVento){
    _velVento = velVento;
  }

  void setHoraAmanhecer(String horaAmanhecer){
    _horaAmanhecer = horaAmanhecer;
  }

  void setHoraAnoitecer(String horaAnoitecer){
    _horaAnoitecer = horaAnoitecer;
  }
  
  void setHoraAtualizacao(String hora){
    _horaAtualizacao = hora;
  }

  String getTemperatura(){
    return this._temperatura;
  }

  String getData(){
    return this._data;
  }

  String getTempo(){
    return this._tempo;
  }

  String getDiaOuNoite(){
    return this._diaOuNoite;
  }

  String getCidade(){
    return this._cidade;
  }

  String getHumidade(){
    return this._humidade;
  }

  String getVelVento(){
    return this._velVento;
  }

  String getHoraAmanhecer(){
    return this._horaAmanhecer;
  }

  String getHoraAnoitecer(){
    return this._horaAnoitecer;
  }

  String getHoraAtualizacao(){
    return this._horaAtualizacao;
  }
}