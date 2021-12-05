class com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager
{
   var SHELL = undefined;
   static var _NECK_AMULET_ID = 3032;
   static var _SPECIAL_DANCE_FRAME = 26;
   static var _FIRE_NINJA_HEAD_ITEM_ID = 1086;
   static var _FIRE_NINJA_FACE_ITEM_ID = 2013;
   static var _FIRE_NINJA_BODY_ITEM_ID = 4120;
   static var _FIRE_NINJA_FEET_ITEM_ID = 6025;
   static var _WATER_NINJA_HEAD_ITEM_ID = 1087;
   static var _WATER_NINJA_FACE_ITEM_ID = 2025;
   static var _WATER_NINJA_BODY_ITEM_ID = 4121;
   static var _WATER_NINJA_FEET_ITEM_ID = 6026;
   static var _SNOW_NINJA_HEAD_ITEM_ID = -1;
   static var _SNOW_NINJA_FACE_ITEM_ID = -1;
   static var _SNOW_NINJA_BODY_ITEM_ID = -1;
   static var _SNOW_NINJA_FEET_ITEM_ID = -1;
   static var _SHADOW_NINJA_HEAD_ITEM_ID = 1271;
   static var _SHADOW_NINJA_FACE_ITEM_ID = 2033;
   static var _SHADOW_NINJA_BODY_ITEM_ID = 4380;
   static var _SHADOW_NINJA_FEET_ITEM_ID = 6077;
   var _intervalId = -1;
   var _dancingFirePlayers = 0;
   var _dancingWaterPlayers = 0;
   var _dancingSnowPlayers = 0;
   var _dancingShadowPlayers = 0;
   var _playFireEffect = false;
   var _playWaterEffect = false;
   var _playSnowEffect = false;
   var _playShadowEffect = false;
   var _checkInterval = 4000;
   var _fireAnimationHeight = 55;
   var _fireAnimationSpeed = 1;
   var _fireAmount = 3;
   var _fireShrinkSize = 100;
   var _fireDelayTime = 2;
   var _rainAnimationHeight = 85;
   var _rainAnimationSpeed = 0.5;
   var _rainAmount = 25;
   var _rainShrinkSize = 25;
   var _rainFadeAmount = 50;
   var _rainDelayTime = 2;
   var _rainRotation = -26;
   var _snowAnimationHeight = 85;
   var _snowAnimationSpeed = 1;
   var _snowAmount = 25;
   var _snowShrinkSize = 50;
   var _snowFadeAmount = 50;
   var _snowDelayTime = 2;
   static var EFFECT_TYPE_FIRE = "Fire";
   static var EFFECT_TYPE_WATER = "Water";
   static var EFFECT_TYPE_SNOW = "Snow";
   static var EFFECT_TYPE_TIE = "Tie";
   static var EFFECT_TYPE_DEFAULT = "Default";
   static var EFFECT_TYPE_EMPTY = "Empty";
   static var OBJECT_TYPE_SKY = "Sky";
   static var OBJECT_TYPE_CLOUDS = "Clouds";
   static var OBJECT_TYPE_DISTANT_OBJ = "DistantObjects";
   static var OBJECT_TYPE_TOP_CLOUDS = "TopClouds";
   static var OBJECT_TYPE_SHELL = "TintShell";
   function WeatherEffectsManager(shell, background)
   {
      this.SHELL = shell;
      this.background_mc = background;
      com.greensock.plugins.TweenPlugin.activate([com.greensock.plugins.ColorTransformPlugin]);
      this.setDefaultTintValues(2,com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.EFFECT_TYPE_DEFAULT);
   }
   function getDancingFirePlayers()
   {
      return this._dancingFirePlayers;
   }
   function getDancingWaterPlayers()
   {
      return this._dancingWaterPlayers;
   }
   function getDancingSnowPlayers()
   {
      return this._dancingSnowPlayers;
   }
   function getDancingShadowPlayers()
   {
      return this._dancingShadowPlayers;
   }
   function __set__checkInterval(interval)
   {
      this._checkInterval = interval;
      return this.__get__checkInterval();
   }
   function __get__fireAnimationHeight()
   {
      return this._fireAnimationHeight;
   }
   function __get__fireAnimationSpeed()
   {
      return this._fireAnimationSpeed;
   }
   function __get__fireAmount()
   {
      return this._fireAmount;
   }
   function __get__fireShrinkSize()
   {
      return this._fireShrinkSize;
   }
   function __get__fireDelayTime()
   {
      return this._fireDelayTime;
   }
   function __get__rainAnimationHeight()
   {
      return this._rainAnimationHeight;
   }
   function __get__rainAnimationSpeed()
   {
      return this._rainAnimationSpeed;
   }
   function __get__rainAmount()
   {
      return this._rainAmount;
   }
   function __get__rainShrinkSize()
   {
      return this._rainShrinkSize;
   }
   function __get__rainFadeAmount()
   {
      return this._rainFadeAmount;
   }
   function __get__rainDelayTime()
   {
      return this._rainDelayTime;
   }
   function __get__rainRotation()
   {
      return this._rainRotation;
   }
   function __get__snowAnimationHeight()
   {
      return this._snowAnimationHeight;
   }
   function __get__snowAnimationSpeed()
   {
      return this._snowAnimationSpeed;
   }
   function __get__snowAmount()
   {
      return this._snowAmount;
   }
   function __get__snowShrinkSize()
   {
      return this._snowShrinkSize;
   }
   function __get__snowFadeAmount()
   {
      return this._snowFadeAmount;
   }
   function __get__snowDelayTime()
   {
      return this._snowDelayTime;
   }
   function __get__currentColorState()
   {
      return this._currentColorState;
   }
   function __get__colorFireState()
   {
      return this._colorFireState;
   }
   function __get__colorWaterState()
   {
      return this._colorWaterState;
   }
   function __get__colorSnowState()
   {
      return this._colorSnowState;
   }
   function __get__colorTieState()
   {
      return this._colorTieState;
   }
   function __get__colorDefaultState()
   {
      return this._colorDefaultState;
   }
   function __get__currentColorMode()
   {
      return this._currentColorMode;
   }
   function __set__currentColorMode(mode)
   {
      this._currentColorMode = mode;
      return this.__get__currentColorMode();
   }
   function __get__nextColorMode()
   {
      return this._nextColorMode;
   }
   function __get__colorModeA()
   {
      return this._colorModeA;
   }
   function __get__colorModeB()
   {
      return this._colorModeB;
   }
   function __get__colorModeC()
   {
      return this._colorModeC;
   }
   function __get__currentShadowState()
   {
      return this._currentShadowState;
   }
   function __get__shadowFireState()
   {
      return this._shadowFireState;
   }
   function __get__shadowWaterState()
   {
      return this._shadowWaterState;
   }
   function __get__shadowSnowState()
   {
      return this._shadowSnowState;
   }
   function __get__shadowTieState()
   {
      return this._shadowTieState;
   }
   function __get__shadowDefaultState()
   {
      return this._shadowDefaultState;
   }
   function __get__shadowEmptyState()
   {
      return this._shadowEmptyState;
   }
   function __get__currentShadowMode()
   {
      return this._currentShadowMode;
   }
   function __set__currentShadowMode(mode)
   {
      this._currentShadowMode = mode;
      return this.__get__currentShadowMode();
   }
   function __get__nextShadowMode()
   {
      return this._nextShadowMode;
   }
   function __get__shadowModeA()
   {
      return this._shadowModeA;
   }
   function __get__shadowModeB()
   {
      return this._shadowModeB;
   }
   function __get__shadowModeC()
   {
      return this._shadowModeC;
   }
   function startWeatherEffectCheck()
   {
      this.initStates();
      this._intervalId = setInterval(com.clubpenguin.util.Delegate.create(this,this.checkOutfitandSpecialDance),this._checkInterval);
   }
   function stopWeatherEffectCheck()
   {
      clearInterval(this._intervalId);
      this._intervalId = -1;
   }
   function initialize(fireAnimationHeight, fireAnimationSpeed, fireAmount, fireDelayTime, rainAnimationHeight, rainAmount, rainShrinkSize, rainFadeAmount, rainDelayTime, rainRotation, snowAnimationHeight, snowAmount, snowShrinkSize, snowFadeAmount, snowDelayTime)
   {
      this.setupFireAnimationHeight(fireAnimationHeight);
      this.setupFireAnimationSpeed(fireAnimationSpeed);
      this.setupFireAmount(fireAmount);
      this.setupFireDelayTime(fireDelayTime);
      this.setupRainAnimationHeight(rainAnimationHeight);
      this.setupRainAmount(rainAmount);
      this.setupRainShrinkSize(rainShrinkSize);
      this.setupRainFadeAmount(rainFadeAmount);
      this.setupRainDelayTime(rainDelayTime);
      this.setupRainRotation(rainRotation);
      this.setupSnowAnimationHeight(snowAnimationHeight);
      this.setupSnowAmount(snowAmount);
      this.setupSnowShrinkSize(snowShrinkSize);
      this.setupSnowFadeAmount(snowFadeAmount);
      this.setupSnowDelayTime(snowDelayTime);
   }
   function setupIntervalCheck(interval)
   {
      this._checkInterval = interval;
   }
   function setupFireAnimationHeight(height)
   {
      this._fireAnimationHeight = height;
   }
   function setupFireAnimationSpeed(speed)
   {
      this._fireAnimationSpeed = speed;
   }
   function setupFireAmount(amount)
   {
      this._fireAmount = amount;
   }
   function setupFireDelayTime(delay)
   {
      this._fireDelayTime = delay;
   }
   function setupRainAnimationHeight(height)
   {
      this._rainAnimationHeight = height;
   }
   function setupRainAnimationSpeed(speed)
   {
      this._rainAnimationSpeed = speed;
   }
   function setupRainAmount(amount)
   {
      this._rainAmount = amount;
   }
   function setupRainShrinkSize(shrinkSize)
   {
      this._rainShrinkSize = shrinkSize;
   }
   function setupRainFadeAmount(rainFadeAmount)
   {
      this._rainFadeAmount = rainFadeAmount;
   }
   function setupRainDelayTime(delay)
   {
      this._rainDelayTime = delay;
   }
   function setupRainRotation(rotation)
   {
      this._rainRotation = rotation;
   }
   function setupSnowAnimationHeight(height)
   {
      this._snowAnimationHeight = height;
   }
   function setupSnowAnimationSpeed(speed)
   {
      this._snowAnimationSpeed = speed;
   }
   function setupSnowAmount(amount)
   {
      this._snowAmount = amount;
   }
   function setupSnowShrinkSize(shrinkSize)
   {
      this._snowShrinkSize = shrinkSize;
   }
   function getBackogrundMC()
   {
      return this.background_mc;
   }
   function setupSnowFadeAmount(snowFadeAmount)
   {
      this._snowFadeAmount = snowFadeAmount;
   }
   function setupSnowDelayTime(snowDelayTime)
   {
      this._snowDelayTime = snowDelayTime;
   }
   function playWeatherEffect(effectType)
   {
      this._currentColorState.playWeatherEffect(effectType);
   }
   function __set__currentColorState(state)
   {
      this._currentColorState = state;
      this._currentColorMode = this._nextColorMode;
      this._currentColorState.applyState();
      return this.__get__currentColorState();
   }
   function initStates()
   {
      this._colorFireState = new com.clubpenguin.world.rooms.weathereffects.state.color.ColorFireState(this);
      this._colorWaterState = new com.clubpenguin.world.rooms.weathereffects.state.color.ColorWaterState(this);
      this._colorSnowState = new com.clubpenguin.world.rooms.weathereffects.state.color.ColorSnowState(this);
      this._colorTieState = new com.clubpenguin.world.rooms.weathereffects.state.color.ColorTieState(this);
      this._colorDefaultState = new com.clubpenguin.world.rooms.weathereffects.state.color.ColorDefaultState(this);
      this._colorModeA = new com.clubpenguin.world.rooms.weathereffects.state.mode.ModeA();
      this._colorModeB = new com.clubpenguin.world.rooms.weathereffects.state.mode.ModeB();
      this._colorModeC = new com.clubpenguin.world.rooms.weathereffects.state.mode.ModeC();
      this._currentColorMode = this._nextColorMode = this._colorModeA;
      this._currentColorState = this._colorDefaultState;
      this._shadowFireState = new com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowFireState(this);
      this._shadowWaterState = new com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowWaterState(this);
      this._shadowSnowState = new com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowSnowState(this);
      this._shadowTieState = new com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowTieState(this);
      this._shadowDefaultState = new com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowDefaultState(this);
      this._shadowEmptyState = new com.clubpenguin.world.rooms.weathereffects.state.shadow.ShadowEmptyState(this);
      this._shadowModeA = new com.clubpenguin.world.rooms.weathereffects.state.mode.ModeA();
      this._shadowModeB = new com.clubpenguin.world.rooms.weathereffects.state.mode.ModeB();
      this._shadowModeC = new com.clubpenguin.world.rooms.weathereffects.state.mode.ModeC();
      this._currentShadowMode = this._nextShadowMode = this._shadowModeA;
      this._currentShadowState = this._shadowEmptyState;
   }
   function determineColorMode(numberOfUsers)
   {
      if(numberOfUsers <= 2)
      {
         return this._colorModeA;
      }
      if(numberOfUsers == 3)
      {
         return this._colorModeB;
      }
      if(numberOfUsers >= 4)
      {
         return this._colorModeC;
      }
      return this._colorModeA;
   }
   function __set__currentShadowState(state)
   {
      this._currentShadowState = state;
      this._currentShadowMode = this._nextShadowMode;
      this._currentShadowState.applyState();
      return this.__get__currentShadowState();
   }
   function determineShadowMode(numberOfUsers)
   {
      if(numberOfUsers <= 2)
      {
         return this._shadowModeA;
      }
      if(numberOfUsers == 3)
      {
         return this._shadowModeB;
      }
      if(numberOfUsers >= 4)
      {
         return this._shadowModeC;
      }
      return this._shadowModeA;
   }
   function determineShadowState()
   {
      switch(this._currentColorState)
      {
         case this._colorFireState:
            this._currentShadowState.toFireState();
            break;
         case this._colorWaterState:
            this._currentShadowState.toWaterState();
            break;
         case this._colorSnowState:
            this._currentShadowState.toSnowState();
            break;
         case this._colorTieState:
            this._currentShadowState.toTieState();
            break;
         case this._colorDefaultState:
            this._currentShadowState.toDefaultState();
      }
   }
   function checkOutfitandSpecialDance()
   {
      this._dancingFirePlayers = 0;
      this._dancingWaterPlayers = 0;
      this._dancingSnowPlayers = 0;
      this._dancingShadowPlayers = 0;
      var _loc3_ = 0;
      while(_loc3_ < this.SHELL.getPlayerList().length)
      {
         var _loc2_ = this.SHELL.getPlayerList()[_loc3_];
         if(this.isWearingFireOutfit(_loc2_) && this.isDoingSpecialDance(_loc2_))
         {
            this._dancingFirePlayers = this._dancingFirePlayers + 1;
         }
         if(this.isWearingWaterOutfit(_loc2_) && this.isDoingSpecialDance(_loc2_))
         {
            this._dancingWaterPlayers = this._dancingWaterPlayers + 1;
         }
         if(this.isWearingSnowOutfit(_loc2_) && this.isDoingSpecialDance(_loc2_))
         {
            this._dancingSnowPlayers = this._dancingSnowPlayers + 1;
         }
         if(this.isWearingShadowOutfit(_loc2_) && this.isDoingSpecialDance(_loc2_))
         {
            this._dancingShadowPlayers = this._dancingShadowPlayers + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.SHELL.getPlayerList().length < 2)
      {
         this.resetToDefaultValues();
         this._nextShadowMode = this.determineShadowMode(this._dancingShadowPlayers);
         this._currentShadowState.toEmptyState();
         return undefined;
      }
      this.determinePlayableWeatherEffects();
   }
   function determinePlayableWeatherEffects()
   {
      this._playFireEffect = false;
      this._playWaterEffect = false;
      this._playSnowEffect = false;
      this._playShadowEffect = false;
      if(this._dancingFirePlayers >= 2)
      {
         this._playFireEffect = true;
      }
      if(this._dancingWaterPlayers >= 2)
      {
         this._playWaterEffect = true;
      }
      if(this._dancingSnowPlayers >= 2)
      {
         this._playSnowEffect = true;
      }
      if(this._dancingShadowPlayers >= 2)
      {
         this._playShadowEffect = true;
      }
      if(this._dancingWaterPlayers >= this._dancingFirePlayers)
      {
         this._playFireEffect = false;
      }
      if(this._dancingFirePlayers >= this._dancingSnowPlayers)
      {
         this._playSnowEffect = false;
      }
      if(this._dancingSnowPlayers >= this._dancingWaterPlayers)
      {
         this._playWaterEffect = false;
      }
      if(this._dancingWaterPlayers < this._dancingFirePlayers)
      {
         this._playWaterEffect = false;
      }
      if(this._dancingSnowPlayers < this._dancingWaterPlayers)
      {
         this._playSnowEffect = false;
      }
      if(this._dancingFirePlayers < this._dancingSnowPlayers)
      {
         this._playFireEffect = false;
      }
      if(this._dancingFirePlayers >= 2 && this._dancingFirePlayers == this._dancingWaterPlayers && this._dancingFirePlayers == this._dancingSnowPlayers)
      {
         this._playFireEffect = true;
         this._playWaterEffect = true;
         this._playSnowEffect = true;
      }
      if(this._playFireEffect || this._playWaterEffect || this._playSnowEffect)
      {
         this.determineWhichStateShouldBePlayed();
      }
      else
      {
         this.resetToDefaultValues();
      }
      if(this._playShadowEffect)
      {
         this.determineWhichShadowStateShouldBePlayed();
      }
      if(!this._playShadowEffect)
      {
         this._nextShadowMode = this.determineShadowMode(this._dancingShadowPlayers);
         if(this._nextShadowMode != this._currentShadowMode || this._currentShadowState != this._shadowEmptyState)
         {
            trace("RESET SHADOW");
            this._currentShadowState.toEmptyState();
         }
      }
   }
   function determineWhichStateShouldBePlayed()
   {
      if(!this._playShadowEffect)
      {
         this._nextShadowMode = this.determineShadowMode(this._dancingShadowPlayers);
         if(this._nextShadowMode != this._currentShadowMode || this._currentShadowState != this._shadowEmptyState)
         {
            trace("RESET SHADOW");
            this._currentShadowState.toEmptyState();
         }
      }
      if(this._playFireEffect && this._playWaterEffect && this._playSnowEffect)
      {
         this._nextColorMode = this.determineColorMode(this._dancingFirePlayers);
         this._currentColorState.toTieState();
         if(this._playShadowEffect)
         {
            this.determineWhichShadowStateShouldBePlayed();
         }
         return undefined;
      }
      if(this._playFireEffect)
      {
         this._nextColorMode = this.determineColorMode(this._dancingFirePlayers);
         this._currentColorState.toFireState();
         if(this._playShadowEffect)
         {
            this.determineWhichShadowStateShouldBePlayed();
         }
         return undefined;
      }
      if(this._playWaterEffect)
      {
         this._nextColorMode = this.determineColorMode(this._dancingWaterPlayers);
         this._currentColorState.toWaterState();
         if(this._playShadowEffect)
         {
            this.determineWhichShadowStateShouldBePlayed();
         }
         return undefined;
      }
      if(this._playSnowEffect)
      {
         this._nextColorMode = this.determineColorMode(this._dancingSnowPlayers);
         this._currentColorState.toSnowState();
         if(this._playShadowEffect)
         {
            this.determineWhichShadowStateShouldBePlayed();
         }
         return undefined;
      }
      if(!this._playFireEffect && !this._playWaterEffect && !this._playSnowEffect)
      {
         this.resetToDefaultValues();
      }
   }
   function determineWhichShadowStateShouldBePlayed()
   {
      trace("DETERMINING WHICH SHADOW STATE SHOULD BE PLAYED");
      this._nextShadowMode = this.determineShadowMode(this._dancingShadowPlayers);
      if(this._playShadowEffect)
      {
         this.determineShadowState();
         return undefined;
      }
      this._currentShadowState.toEmptyState();
   }
   function setDefaultTintValues(numOfPlayers, effectType)
   {
      var _loc2_ = new Object();
      _loc2_.tintType = !this._playShadowEffect ? "color" : "shadow";
      _loc2_.state = "Mode" + (numOfPlayers - 1 <= 2 ? (numOfPlayers - 1 != 2 ? "A" : "B") : "C");
      _loc2_.effectType = effectType;
      _loc2_.stateForSettings = "Mode" + (numOfPlayers <= 2 ? "A" : "B");
      if(effectType == com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.EFFECT_TYPE_DEFAULT && !this._playShadowEffect)
      {
         _loc2_.state = "ModeA";
      }
      _loc2_.sky = com.clubpenguin.world.rooms.weathereffects.WeatherEffectsSettings[_loc2_.tintType + effectType + com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.OBJECT_TYPE_SKY + _loc2_.stateForSettings];
      _loc2_.clouds = com.clubpenguin.world.rooms.weathereffects.WeatherEffectsSettings[_loc2_.tintType + effectType + com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.OBJECT_TYPE_CLOUDS + _loc2_.stateForSettings];
      _loc2_.distantObjects = com.clubpenguin.world.rooms.weathereffects.WeatherEffectsSettings[_loc2_.tintType + effectType + com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.OBJECT_TYPE_DISTANT_OBJ + _loc2_.stateForSettings];
      _loc2_.topCoulds = com.clubpenguin.world.rooms.weathereffects.WeatherEffectsSettings[_loc2_.tintType + effectType + com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager.OBJECT_TYPE_TOP_CLOUDS + _loc2_.stateForSettings];
      com.greensock.TweenMax.to(this.background_mc.weatherEffects_mc.bgSky.bgSkyShadow.bgSkyColor,0,{colorTransform:_loc2_.sky});
   }
   function resetToDefaultValues()
   {
      if(this._currentColorState == this._colorDefaultState)
      {
         return undefined;
      }
      this._nextColorMode = this.determineColorMode(0);
      this._currentColorState.toDefaultState();
   }
   function isWearingFireOutfit(player)
   {
      if(player.head != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._FIRE_NINJA_HEAD_ITEM_ID)
      {
         return false;
      }
      if(player.face != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._FIRE_NINJA_FACE_ITEM_ID)
      {
         return false;
      }
      if(player.body != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._FIRE_NINJA_BODY_ITEM_ID)
      {
         return false;
      }
      if(player.feet != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._FIRE_NINJA_FEET_ITEM_ID)
      {
         return false;
      }
      return true;
   }
   function isWearingWaterOutfit(player)
   {
      if(player.head != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._WATER_NINJA_HEAD_ITEM_ID)
      {
         return false;
      }
      if(player.face != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._WATER_NINJA_FACE_ITEM_ID)
      {
         return false;
      }
      if(player.body != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._WATER_NINJA_BODY_ITEM_ID)
      {
         return false;
      }
      if(player.feet != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._WATER_NINJA_FEET_ITEM_ID)
      {
         return false;
      }
      return true;
   }
   function isWearingSnowOutfit(player)
   {
      if(player.head != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SNOW_NINJA_HEAD_ITEM_ID)
      {
         return false;
      }
      if(player.face != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SNOW_NINJA_FACE_ITEM_ID)
      {
         return false;
      }
      if(player.body != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SNOW_NINJA_BODY_ITEM_ID)
      {
         return false;
      }
      if(player.feet != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SNOW_NINJA_FEET_ITEM_ID)
      {
         return false;
      }
      return true;
   }
   function isWearingShadowOutfit(player)
   {
      if(player.head != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SHADOW_NINJA_HEAD_ITEM_ID)
      {
         return false;
      }
      if(player.face != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SHADOW_NINJA_FACE_ITEM_ID)
      {
         return false;
      }
      if(player.body != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SHADOW_NINJA_BODY_ITEM_ID)
      {
         return false;
      }
      if(player.feet != com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SHADOW_NINJA_FEET_ITEM_ID)
      {
         return false;
      }
      return true;
   }
   function isDoingSpecialDance(player)
   {
      var _loc3_ = this.SHELL.getSecretFrame(player.player_id,player.frame);
      if(player.frame == com.clubpenguin.world.rooms.weathereffects.WeatherEffectsManager._SPECIAL_DANCE_FRAME && player.frame != _loc3_)
      {
         return true;
      }
      return false;
   }
   function traceCurrentRoomStatus()
   {
      trace("=====================================");
      trace("FIRE DANCERS   " + this._dancingFirePlayers);
      trace("WATER DANCERS  " + this._dancingWaterPlayers);
      trace("SNOW DANCERS   " + this._dancingSnowPlayers);
      trace("SHADOW DANCERS " + this._dancingShadowPlayers);
      trace("PLAY FIRE EFFECT:   " + this._playFireEffect);
      trace("PLAY WATER EFFECT:  " + this._playWaterEffect);
      trace("PLAY SNOW EFFECT:   " + this._playSnowEffect);
      trace("PLAY SHADOW EFFECT: " + this._playShadowEffect);
      trace("===========================");
   }
}
