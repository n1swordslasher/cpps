class com.clubpenguin.world.rooms.weathereffects.effect.RainEffectGenerator
{
   static var CLASS_NAME = "[RainEffectGenerator] ";
   var _elementArtMc = "WeatherFX_01_Water_Sprite";
   var _maxWidth = Stage.width;
   var _maxHeight = 85;
   var _running = false;
   var _elementSpeed = 0.5;
   var _elementAmount = 25;
   var _elementShrinkSize = 25;
   var _elementDelayTime = 2;
   var _elementRotation = -26;
   function RainEffectGenerator(wem)
   {
      trace(com.clubpenguin.world.rooms.weathereffects.effect.RainEffectGenerator.CLASS_NAME + "Instatiated");
      this._wem = wem;
      this._maxHeight = wem.rainAnimationHeight;
      this._elementSpeed = wem.rainAnimationSpeed;
      this._elementAmount = wem.rainAmount;
      this._elementShrinkSize = wem.rainShrinkSize;
      this._elementDelayTime = wem.rainDelayTime;
      this._elementRotation = wem.rainRotation;
      this.setMovieClips();
   }
   function setMovieClips()
   {
      this._elementHolder = this._wem.getBackogrundMC().weatherEffects_mc.waterEffect;
   }
   function startEffect()
   {
      if(this._running)
      {
         return undefined;
      }
      trace(com.clubpenguin.world.rooms.weathereffects.effect.RainEffectGenerator.CLASS_NAME + ": startEffect()");
      this._running = true;
      var _loc2_ = 0;
      while(_loc2_ < this._elementAmount)
      {
         this.setupElement(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function stopEffect()
   {
      trace(com.clubpenguin.world.rooms.weathereffects.effect.RainEffectGenerator.CLASS_NAME + ": stopEffect()");
      this._running = false;
   }
   function setupElement(index)
   {
      var _loc2_ = this._elementHolder.attachMovie(this._elementArtMc,"r" + index,index + 200);
      _loc2_.index = index;
      this.beginEffect(_loc2_,this);
   }
   function beginEffect(me, effect)
   {
      if(!effect._running)
      {
         me.removeMovieClip();
         return undefined;
      }
      var _loc4_ = effect._elementSpeed;
      var _loc5_ = Math.random() * effect._elementDelayTime;
      me._y = 0;
      me._x = int(Math.random() * effect._maxWidth);
      me._rotation = effect._elementRotation;
      me._alpha = 100;
      me._yscale = 100;
      me._xscale = 100;
      var _loc3_ = new Array();
      _loc3_.push(me);
      _loc3_.push(effect);
      com.greensock.TweenMax.to(me,_loc4_,{_y:effect._maxHeight,_x:me._x + effect._maxHeight / 2,_yscale:effect._elementShrinkSize,_xscale:effect._elementShrinkSize,delay:_loc5_,ease:com.greensock.easing.Linear.easeOut,onComplete:effect.beginEffect,onCompleteParams:_loc3_});
   }
}
