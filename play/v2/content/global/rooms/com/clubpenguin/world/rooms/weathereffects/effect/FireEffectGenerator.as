class com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator
{
   static var CLASS_NAME = "[FireEffectGenerator] ";
   var _elementArtMc = "WeatherFX_03_Fire_Sprite";
   var _maxWidth = Stage.width;
   static var _maxHeight = 55;
   var _running = false;
   var _elementAmount = 3;
   static var _delayTime = 2;
   function FireEffectGenerator(wem)
   {
      trace(com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator.CLASS_NAME + "Instatiated");
      this._wem = wem;
      com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._maxHeight = this._wem.fireAnimationHeight;
      this._elementAmount = this._wem.fireAmount;
      com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._delayTime = this._wem.fireDelayTime;
      com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._tweenObjects = [];
      this.setMovieClips();
   }
   function setMovieClips()
   {
      this._elementHolder = this._wem.getBackogrundMC().weatherEffects_mc.fireEffect;
   }
   function startEffect()
   {
      if(this._running)
      {
         return undefined;
      }
      trace(com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator.CLASS_NAME + ": startEffect()");
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
      trace(com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator.CLASS_NAME + ": stopEffect()");
      this._running = false;
      var _loc2_ = 0;
      while(_loc2_ < this._elementAmount)
      {
         com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._tweenObjects[_loc2_].repeat = 0;
         _loc2_ = _loc2_ + 1;
      }
   }
   function setupElement(index)
   {
      trace(com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator.CLASS_NAME + ": setupElement()");
      var _loc2_ = this._elementHolder.attachMovie(this._elementArtMc,"f" + index,index + 100);
      _loc2_.gotoAndStop(1);
      _loc2_.index = index;
      var _loc6_ = Math.random() * com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._delayTime;
      var _loc4_ = new Array();
      _loc4_.push(_loc2_);
      _loc4_.push(this);
      com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._tweenObjects[index] = new com.greensock.TweenMax(_loc2_,0,{delay:_loc6_,onComplete:this.beginEffect,onCompleteParams:_loc4_});
      com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._tweenObjects[index].play();
   }
   function beginEffect(me, effect)
   {
      if(!effect._running)
      {
         me.removeMovieClip();
         return undefined;
      }
      me.play();
   }
   static function onAnimDone(mc)
   {
      mc.gotoAndStop(1);
      var _loc2_ = Math.random() * com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._delayTime;
      mc._y = int(Math.random() * com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._maxHeight);
      mc._x = 0;
      com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._tweenObjects[mc.index].delay = _loc2_;
      com.clubpenguin.world.rooms.weathereffects.effect.FireEffectGenerator._tweenObjects[mc.index].restart(true,false);
   }
}
