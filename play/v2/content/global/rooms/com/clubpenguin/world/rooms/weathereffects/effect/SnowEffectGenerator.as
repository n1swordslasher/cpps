class com.clubpenguin.world.rooms.weathereffects.effect.SnowEffectGenerator
{
   static var CLASS_NAME = "[SnowEffectGenerator] ";
   var _elementArtMc = "WeatherFX_02_Snow_Sprite";
   var _maxWidth = Stage.width;
   var _maxHeight = 85;
   var _running = false;
   var _elementSpeed = 1;
   var _elementAmount = 25;
   var _elementShrinkSize = 50;
   var _delayTime = 2;
   function SnowEffectGenerator(wem)
   {
      trace(com.clubpenguin.world.rooms.weathereffects.effect.SnowEffectGenerator.CLASS_NAME + "Instatiated");
      this._wem = wem;
      this._maxHeight = wem.snowAnimationHeight;
      this._elementSpeed = wem.snowAnimationSpeed;
      this._elementAmount = wem.snowAmount;
      this._elementShrinkSize = wem.snowShrinkSize;
      this._delayTime = wem.snowDelayTime;
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
      trace(com.clubpenguin.world.rooms.weathereffects.effect.SnowEffectGenerator.CLASS_NAME + ": startEffect()");
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
      trace(com.clubpenguin.world.rooms.weathereffects.effect.SnowEffectGenerator.CLASS_NAME + ": stopEffect()");
      this._running = false;
   }
   function setupElement(index)
   {
      var _loc2_ = this._elementHolder.attachMovie(this._elementArtMc,"s" + index,index + 300);
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
      effect._running = true;
      var _loc5_ = effect._elementSpeed;
      var _loc4_ = Math.random() * effect._delayTime;
      me._y = -5;
      me._x = int(Math.random() * effect._maxWidth);
      me._alpha = 100;
      me._yscale = 100;
      me._xscale = 100;
      var _loc3_ = new Array();
      _loc3_.push(me);
      _loc3_.push(effect);
      com.greensock.TweenMax.to(me,_loc5_,{_y:effect._maxHeight,_x:me._x + effect._maxHeight / 2,_yscale:effect._elementShrinkSize,_xscale:effect._elementShrinkSize,delay:_loc4_,ease:com.greensock.easing.Linear.easeOut,onComplete:effect.beginEffect,onCompleteParams:_loc3_});
   }
}
