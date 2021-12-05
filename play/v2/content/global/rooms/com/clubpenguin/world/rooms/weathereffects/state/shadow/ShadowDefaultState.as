class com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowDefaultState extends com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowState implements com.clubpenguin.world.rooms.weathereffects.state.shadow.IShadowState
{
   function ShadowDefaultState(manager)
   {
      super(manager);
   }
   function toFireState()
   {
      this.resetState();
      this._wem.__set__currentShadowState(this._wem.shadowFireState);
      trace("[SHADOW] from DEFAULT state to FIRE state");
   }
   function toWaterState()
   {
      this.resetState();
      this._wem.__set__currentShadowState(this._wem.shadowWaterState);
      trace("[SHADOW] from DEFAULT state to WATER state");
   }
   function toSnowState()
   {
      this.resetState();
      this._wem.__set__currentShadowState(this._wem.shadowSnowState);
      trace("[SHADOW] from DEFAULT state to SNOW state");
   }
   function toTieState()
   {
      this.resetState();
      this._wem.__set__currentShadowState(this._wem.shadowTieState);
      trace("[SHADOW] from DEFAULT state to TIE state");
   }
   function toDefaultState()
   {
      if(this._wem.__get__currentShadowMode() == this._wem.__get__nextShadowMode())
      {
         return undefined;
      }
      trace("[SHADOW] CURRENT SHADOW MODE: " + this._wem.__get__currentShadowMode().getMode() + " NEXT SHADOW MODE: " + this._wem.__get__nextShadowMode().getMode());
      this.applyTinting(this._wem.__get__nextShadowMode().getMode(),com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.EFFECT_TYPE_DEFAULT);
      if(this._wem.__get__currentShadowMode().getMode() == "A")
      {
         this.showClouds();
      }
      if(this._wem.__get__nextShadowMode().getMode() == "A")
      {
         this.removeClouds();
      }
      if(this._wem.__get__nextShadowMode().getMode() == "C")
      {
         this.playShadowEffect();
      }
      if(this._wem.__get__currentShadowMode().getMode() == "C")
      {
         this.stopShadowEffect();
      }
      this._wem.__set__currentShadowState(this._wem.shadowDefaultState);
      trace("[SHADOW] from DEFAULT state to DEFAULT state");
   }
   function toEmptyState()
   {
      this.resetState();
      this._wem.__set__currentShadowState(this._wem.shadowEmptyState);
      trace("[SHADOW] from DEFAULT state to EMPTY state");
   }
   function applyState()
   {
      this.applyTinting(this._wem.__get__currentShadowMode().getMode(),com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.EFFECT_TYPE_DEFAULT);
      if(this._wem.__get__currentShadowMode().getMode() == "B" || this._wem.__get__currentShadowMode().getMode() == "C")
      {
         this.showClouds();
      }
      if(this._wem.__get__currentShadowMode().getMode() == "C")
      {
         this.playShadowEffect();
      }
      if(this._wem.__get__currentShadowMode().getMode() == "A")
      {
         this.removeClouds();
      }
      trace("[SHADOW] APPLYING DEFAULT STATE IN MODE " + this._wem.__get__currentShadowMode());
   }
   function resetState()
   {
      if(this._wem.__get__currentShadowMode().getMode() != "A" && this._wem.__get__nextShadowMode().getMode() == "A")
      {
         this.removeClouds();
      }
      if(this._wem.__get__currentShadowMode().getMode() == "C" && this._wem.__get__nextShadowMode().getMode() != "C")
      {
         this.stopShadowEffect();
      }
   }
}
