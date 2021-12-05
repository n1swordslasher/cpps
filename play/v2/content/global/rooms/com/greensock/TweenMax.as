class com.greensock.TweenMax extends com.greensock.TweenLite
{
   static var version = 11.691;
   static var _activatedPlugins = com.greensock.plugins.TweenPlugin.activate([com.greensock.plugins.AutoAlphaPlugin,com.greensock.plugins.EndArrayPlugin,com.greensock.plugins.FramePlugin,com.greensock.plugins.RemoveTintPlugin,com.greensock.plugins.TintPlugin,com.greensock.plugins.VisiblePlugin,com.greensock.plugins.VolumePlugin,com.greensock.plugins.BevelFilterPlugin,com.greensock.plugins.BezierPlugin,com.greensock.plugins.BezierThroughPlugin,com.greensock.plugins.BlurFilterPlugin,com.greensock.plugins.ColorMatrixFilterPlugin,com.greensock.plugins.ColorTransformPlugin,com.greensock.plugins.DropShadowFilterPlugin,com.greensock.plugins.FrameLabelPlugin,com.greensock.plugins.GlowFilterPlugin,com.greensock.plugins.HexColorsPlugin,com.greensock.plugins.RoundPropsPlugin,com.greensock.plugins.ShortRotationPlugin,{}]);
   static var _overwriteMode = !com.greensock.OverwriteManager.enabled ? com.greensock.OverwriteManager.init(2) : com.greensock.OverwriteManager.mode;
   static var killTweensOf = com.greensock.TweenLite.killTweensOf;
   static var killDelayedCallsTo = com.greensock.TweenLite.killTweensOf;
   function TweenMax(target, duration, vars)
   {
      super(target,duration,vars);
      if(com.greensock.TweenLite.version < 11.2)
      {
         trace("TweenMax warning: Please update your TweenLite class or try deleting your ASO files. TweenMax requires a more recent version. Download updates at http://www.TweenMax.com.");
      }
      this._cyclesComplete = 0;
      this.yoyo = Boolean(this.vars.yoyo);
      this._repeat = this.vars.repeat || 0;
      this._repeatDelay = this.vars.repeatDelay || 0;
      this.cacheIsDirty = true;
      if(this.vars.timeScale != undefined && !(this.target instanceof com.greensock.core.TweenCore))
      {
         this.cachedTimeScale = this.vars.timeScale;
      }
   }
   function init()
   {
      if(this.vars.startAt)
      {
         this.vars.startAt.overwrite = 0;
         this.vars.startAt.immediateRender = true;
         var _loc3_ = new com.greensock.TweenMax(this.target,0,this.vars.startAt);
      }
      super.init();
   }
   function invalidate()
   {
      this.yoyo = Boolean(this.vars.yoyo);
      this._repeat = this.vars.repeat || 0;
      this._repeatDelay = this.vars.repeatDelay || 0;
      this.setDirtyCache(true);
      super.invalidate();
   }
   function updateTo(vars, resetDuration)
   {
      var _loc7_ = this.ratio;
      if(resetDuration && this.timeline != undefined && this.cachedStartTime < this.timeline.cachedTime)
      {
         this.cachedStartTime = this.timeline.cachedTime;
         this.setDirtyCache(false);
         if(this.gc)
         {
            this.setEnabled(true,false);
         }
         else
         {
            this.timeline.insert(this,this.cachedStartTime - this._delay);
         }
      }
      for(var _loc6_ in vars)
      {
         this.vars[_loc6_] = vars[_loc6_];
      }
      if(this.initted)
      {
         if(resetDuration)
         {
            this.initted = false;
         }
         else
         {
            if(this._notifyPluginsOfEnabled && this.cachedPT1)
            {
               com.greensock.TweenLite.onPluginEvent("onDisable",this);
            }
            if(this.cachedTime / this.cachedDuration > 0.998)
            {
               var _loc8_ = this.cachedTime;
               this.renderTime(0,true,false);
               this.initted = false;
               this.renderTime(_loc8_,true,false);
            }
            else if(this.cachedTime > 0)
            {
               this.initted = false;
               this.init();
               var _loc5_ = 1 / (1 - _loc7_);
               var _loc2_ = this.cachedPT1;
               var _loc3_ = undefined;
               while(_loc2_)
               {
                  _loc3_ = _loc2_.start + _loc2_.change;
                  _loc2_.change *= _loc5_;
                  _loc2_.start = _loc3_ - _loc2_.change;
                  _loc2_ = _loc2_.nextNode;
               }
            }
         }
      }
   }
   function setDestination(property, value, adjustStartValues)
   {
      var _loc2_ = {};
      _loc2_[property] = value;
      this.updateTo(_loc2_,Boolean(adjustStartValues != false));
   }
   function killProperties(names)
   {
      var _loc3_ = {};
      var _loc2_ = names.length;
      while((_loc2_ = _loc2_ - 1) > -1)
      {
         _loc3_[names[_loc2_]] = true;
      }
      this.killVars(_loc3_);
   }
   function renderTime(time, suppressEvents, force)
   {
      var _loc9_ = !this.cacheIsDirty ? this.cachedTotalDuration : this.__get__totalDuration();
      var _loc7_ = this.cachedTotalTime;
      var _loc5_ = undefined;
      var _loc11_ = undefined;
      var _loc6_ = undefined;
      if(time >= _loc9_)
      {
         this.cachedTotalTime = _loc9_;
         this.cachedTime = this.cachedDuration;
         this.ratio = 1;
         _loc5_ = true;
         if(this.cachedDuration == 0)
         {
            if((time == 0 || this._rawPrevTime < 0) && this._rawPrevTime != time)
            {
               force = true;
            }
            this._rawPrevTime = time;
         }
      }
      else if(time <= 0)
      {
         if(time < 0)
         {
            this.active = false;
            if(this.cachedDuration == 0)
            {
               if(this._rawPrevTime >= 0)
               {
                  force = true;
                  _loc5_ = true;
               }
               this._rawPrevTime = time;
            }
         }
         else if(time == 0 && !this.initted)
         {
            force = true;
         }
         this.cachedTotalTime = this.cachedTime = this.ratio = 0;
         if(this.cachedReversed && _loc7_ != 0)
         {
            _loc5_ = true;
         }
      }
      else
      {
         this.cachedTotalTime = this.cachedTime = time;
         _loc6_ = true;
      }
      if(this._repeat != 0)
      {
         var _loc4_ = this.cachedDuration + this._repeatDelay;
         var _loc12_ = this._cyclesComplete;
         this._cyclesComplete = this.cachedTotalTime / _loc4_ >> 0;
         if(this._cyclesComplete == this.cachedTotalTime / _loc4_)
         {
            this._cyclesComplete = this._cyclesComplete - 1;
         }
         if(_loc12_ != this._cyclesComplete)
         {
            _loc11_ = true;
         }
         if(_loc5_)
         {
            if(this.yoyo && this._repeat % 2)
            {
               this.cachedTime = this.ratio = 0;
            }
         }
         else if(time > 0)
         {
            this.cachedTime = (this.cachedTotalTime / _loc4_ - this._cyclesComplete) * _loc4_;
            if(this.yoyo && this._cyclesComplete % 2)
            {
               this.cachedTime = this.cachedDuration - this.cachedTime;
            }
            else if(this.cachedTime >= this.cachedDuration)
            {
               this.cachedTime = this.cachedDuration;
               this.ratio = 1;
               _loc6_ = false;
            }
            if(this.cachedTime <= 0)
            {
               this.cachedTime = this.ratio = 0;
               _loc6_ = false;
            }
         }
         else
         {
            this._cyclesComplete = 0;
         }
      }
      if(_loc7_ == this.cachedTotalTime && !force)
      {
         return undefined;
      }
      if(!this.initted)
      {
         this.init();
      }
      if(!this.active && !this.cachedPaused)
      {
         this.active = true;
      }
      if(_loc6_)
      {
         this.ratio = this._ease(this.cachedTime,0,1,this.cachedDuration);
      }
      if(_loc7_ == 0 && this.vars.onStart && (this.cachedTotalTime != 0 || this.cachedDuration == 0) && !suppressEvents)
      {
         this.vars.onStart.apply(this.vars.onStartScope,this.vars.onStartParams);
      }
      var _loc2_ = this.cachedPT1;
      while(_loc2_)
      {
         _loc2_.target[_loc2_.property] = _loc2_.start + this.ratio * _loc2_.change;
         _loc2_ = _loc2_.nextNode;
      }
      if(this._hasUpdate && !suppressEvents)
      {
         this.vars.onUpdate.apply(this.vars.onUpdateScope,this.vars.onUpdateParams);
      }
      if(_loc11_ && !suppressEvents && !this.gc)
      {
         if(this.vars.onRepeat)
         {
            this.vars.onRepeat.apply(this.vars.onRepeatScope,this.vars.onRepeatParams);
         }
      }
      if(_loc5_ && !this.gc)
      {
         if(this._hasPlugins && this.cachedPT1)
         {
            com.greensock.TweenLite.onPluginEvent("onComplete",this);
         }
         this.complete(true,suppressEvents);
      }
   }
   static function to(target, duration, vars)
   {
      return new com.greensock.TweenMax(target,duration,vars);
   }
   static function from(target, duration, vars)
   {
      vars.runBackwards = true;
      if(vars.immediateRender != false)
      {
         vars.immediateRender = true;
      }
      return new com.greensock.TweenMax(target,duration,vars);
   }
   static function fromTo(target, duration, fromVars, toVars)
   {
      toVars.startAt = fromVars;
      if(fromVars.immediateRender)
      {
         toVars.immediateRender = true;
      }
      return new com.greensock.TweenMax(target,duration,toVars);
   }
   static function allTo(targets, duration, vars, stagger, onCompleteAll, onCompleteAllParams, onCompleteAllScope)
   {
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc1_ = undefined;
      if(stagger == undefined)
      {
         stagger = 0;
      }
      var _loc7_ = targets.length;
      var _loc6_ = [];
      var _loc5_ = vars.delay || 0;
      var onCompleteProxy = vars.onComplete;
      var onCompleteParamsProxy = vars.onCompleteParams;
      var onCompleteScopeProxy = vars.onCompleteScope;
      var _loc9_ = _loc7_ - 1;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         _loc3_ = {};
         for(var _loc1_ in vars)
         {
            _loc3_[_loc1_] = vars[_loc1_];
         }
         _loc3_.delay = _loc5_;
         if(_loc2_ == _loc9_ && onCompleteAll != undefined)
         {
            _loc3_.onComplete = function()
            {
               if(onCompleteProxy != undefined)
               {
                  onCompleteProxy.apply(onCompleteScopeProxy,onCompleteParamsProxy);
               }
               onCompleteAll.apply(onCompleteAllScope,onCompleteAllParams);
            };
         }
         _loc6_[_loc2_] = new com.greensock.TweenMax(targets[_loc2_],duration,_loc3_);
         _loc5_ += stagger;
         _loc2_ = _loc2_ + 1;
      }
      return _loc6_;
   }
   static function allFrom(targets, duration, vars, stagger, onCompleteAll, onCompleteAllParams, onCompleteAllScope)
   {
      vars.runBackwards = true;
      if(vars.immediateRender != false)
      {
         vars.immediateRender = true;
      }
      return com.greensock.TweenMax.allTo(targets,duration,vars,stagger,onCompleteAll,onCompleteAllParams,onCompleteAllScope);
   }
   static function allFromTo(targets, duration, fromVars, toVars, stagger, onCompleteAll, onCompleteAllParams, onCompleteAllScope)
   {
      toVars.startAt = fromVars;
      if(fromVars.immediateRender)
      {
         toVars.immediateRender = true;
      }
      return com.greensock.TweenMax.allTo(targets,duration,toVars,stagger,onCompleteAll,onCompleteAllParams,onCompleteAllScope);
   }
   static function delayedCall(delay, onComplete, onCompleteParams, onCompleteScope, useFrames)
   {
      return new com.greensock.TweenMax(onComplete,0,{delay:delay,onComplete:onComplete,onCompleteParams:onCompleteParams,onCompleteScope:onCompleteScope,immediateRender:false,useFrames:useFrames,overwrite:0});
   }
   static function getTweensOf(target)
   {
      var _loc2_ = com.greensock.TweenLite.masterList[target].tweens;
      var _loc3_ = [];
      if(_loc2_)
      {
         var _loc1_ = _loc2_.length;
         while((_loc1_ = _loc1_ - 1) > -1)
         {
            if(!_loc2_[_loc1_].gc)
            {
               _loc3_[_loc3_.length] = _loc2_[_loc1_];
            }
         }
      }
      return _loc3_;
   }
   static function isTweening(target)
   {
      var _loc3_ = com.greensock.TweenMax.getTweensOf(target);
      var _loc2_ = _loc3_.length;
      var _loc1_ = undefined;
      while((_loc2_ = _loc2_ - 1) > -1)
      {
         _loc1_ = _loc3_[_loc2_];
         if(_loc1_.active || _loc1_.cachedStartTime == _loc1_.timeline.cachedTime && _loc1_.timeline.active)
         {
            return true;
         }
      }
      return false;
   }
   static function getAllTweens()
   {
      var _loc5_ = com.greensock.TweenLite.masterList;
      var _loc4_ = 0;
      var _loc3_ = [];
      var _loc2_ = undefined;
      var _loc1_ = undefined;
      for(var _loc6_ in _loc5_)
      {
         _loc2_ = _loc5_[_loc6_].tweens;
         _loc1_ = _loc2_.length;
         while((_loc1_ = _loc1_ - 1) > -1)
         {
            if(!_loc2_[_loc1_].gc)
            {
               _loc4_;
               _loc3_[_loc4_++] = _loc2_[_loc1_];
            }
         }
      }
      return _loc3_;
   }
   static function killAll(complete, tweens, delayedCalls)
   {
      if(tweens == undefined)
      {
         tweens = true;
      }
      if(delayedCalls == undefined)
      {
         delayedCalls = true;
      }
      var _loc2_ = com.greensock.TweenMax.getAllTweens();
      var _loc3_ = undefined;
      var _loc1_ = _loc2_.length;
      while((_loc1_ = _loc1_ - 1) > -1)
      {
         _loc3_ = _loc2_[_loc1_].target == _loc2_[_loc1_].vars.onComplete;
         if(_loc3_ == delayedCalls || _loc3_ != tweens)
         {
            if(complete == true)
            {
               _loc2_[_loc1_].complete(false,false);
            }
            else
            {
               _loc2_[_loc1_].setEnabled(false,false);
            }
         }
      }
   }
   static function killChildTweensOf(parent, complete)
   {
      var _loc3_ = com.greensock.TweenMax.getAllTweens();
      var _loc4_ = undefined;
      var _loc1_ = undefined;
      var _loc2_ = _loc3_.length;
      while((_loc2_ = _loc2_ - 1) > -1)
      {
         _loc4_ = _loc3_[_loc2_].target;
         if(_loc4_ instanceof MovieClip)
         {
            _loc1_ = _loc4_._parent;
            while(_loc1_)
            {
               if(_loc1_ == parent)
               {
                  if(complete == true)
                  {
                     _loc3_[_loc2_].complete(false,false);
                  }
                  else
                  {
                     _loc3_[_loc2_].setEnabled(false,false);
                  }
               }
               _loc1_ = _loc1_._parent;
            }
         }
      }
   }
   static function pauseAll(tweens, delayedCalls)
   {
      com.greensock.TweenMax.changePause(true,tweens,delayedCalls);
   }
   static function resumeAll(tweens, delayedCalls)
   {
      com.greensock.TweenMax.changePause(false,tweens,delayedCalls);
   }
   static function changePause(pause, tweens, delayedCalls)
   {
      if(tweens == undefined)
      {
         tweens = true;
      }
      if(delayedCalls == undefined)
      {
         delayedCalls = true;
      }
      var _loc2_ = com.greensock.TweenMax.getAllTweens();
      var _loc3_ = undefined;
      var _loc1_ = _loc2_.length;
      while((_loc1_ = _loc1_ - 1) > -1)
      {
         _loc3_ = Boolean(_loc2_[_loc1_].target == _loc2_[_loc1_].vars.onComplete);
         if(_loc3_ == delayedCalls || _loc3_ != tweens)
         {
            _loc2_[_loc1_].paused = pause;
         }
      }
   }
   function __get__currentProgress()
   {
      return this.cachedTime / this.__get__duration();
   }
   function __set__currentProgress(n)
   {
      if(this._cyclesComplete == 0)
      {
         this.setTotalTime(this.__get__duration() * n,false);
      }
      else
      {
         this.setTotalTime(this.__get__duration() * n + this._cyclesComplete * this.cachedDuration,false);
      }
      return this.__get__currentProgress();
   }
   function __get__totalProgress()
   {
      return this.cachedTotalTime / this.__get__totalDuration();
   }
   function __set__totalProgress(n)
   {
      this.setTotalTime(this.__get__totalDuration() * n,false);
      return this.__get__totalProgress();
   }
   function __get__currentTime()
   {
      return this.cachedTime;
   }
   function __set__currentTime(n)
   {
      if(this._cyclesComplete != 0)
      {
         if(this.yoyo && this._cyclesComplete % 2 == 1)
         {
            n = this.__get__duration() - n + this._cyclesComplete * (this.cachedDuration + this._repeatDelay);
         }
         else
         {
            n += this._cyclesComplete * (this.__get__duration() + this._repeatDelay);
         }
      }
      this.setTotalTime(n,false);
      return this.__get__currentTime();
   }
   function __get__totalDuration()
   {
      if(this.cacheIsDirty)
      {
         this.cachedTotalDuration = this._repeat != -1 ? this.cachedDuration * (this._repeat + 1) + this._repeatDelay * this._repeat : 999999999999;
         this.cacheIsDirty = false;
      }
      return this.cachedTotalDuration;
   }
   function __set__totalDuration(n)
   {
      if(this._repeat == -1)
      {
         return undefined;
      }
      this.__set__duration((n - this._repeat * this._repeatDelay) / (this._repeat + 1));
      return this.__get__totalDuration();
   }
   function __get__timeScale()
   {
      return this.cachedTimeScale;
   }
   function __set__timeScale(n)
   {
      if(n == 0)
      {
         n = 0.0001;
      }
      var _loc3_ = !(this.cachedPauseTime || this.cachedPauseTime == 0) ? this.timeline.cachedTotalTime : this.cachedPauseTime;
      this.cachedStartTime = _loc3_ - (_loc3_ - this.cachedStartTime) * this.cachedTimeScale / n;
      this.cachedTimeScale = n;
      this.setDirtyCache(false);
      return this.__get__timeScale();
   }
   function __get__repeat()
   {
      return this._repeat;
   }
   function __set__repeat(n)
   {
      this._repeat = n;
      this.setDirtyCache(true);
      return this.__get__repeat();
   }
   function __get__repeatDelay()
   {
      return this._repeatDelay;
   }
   function __set__repeatDelay(n)
   {
      this._repeatDelay = n;
      this.setDirtyCache(true);
      return this.__get__repeatDelay();
   }
   static function __get__globalTimeScale()
   {
      return com.greensock.TweenLite.rootTimeline != undefined ? com.greensock.TweenLite.rootTimeline.cachedTimeScale : 1;
   }
   static function __set__globalTimeScale(n)
   {
      if(n == 0)
      {
         n = 0.0001;
      }
      if(com.greensock.TweenLite.rootTimeline == undefined)
      {
         com.greensock.TweenLite.to({},0,{});
      }
      var _loc1_ = com.greensock.TweenLite.rootTimeline;
      var _loc2_ = getTimer() * 0.001;
      _loc1_.cachedStartTime = _loc2_ - (_loc2_ - _loc1_.cachedStartTime) * _loc1_.cachedTimeScale / n;
      _loc1_ = com.greensock.TweenLite.rootFramesTimeline;
      _loc2_ = com.greensock.TweenLite.rootFrame;
      _loc1_.cachedStartTime = _loc2_ - (_loc2_ - _loc1_.cachedStartTime) * _loc1_.cachedTimeScale / n;
      com.greensock.TweenLite.rootFramesTimeline.cachedTimeScale = com.greensock.TweenLite.rootTimeline.cachedTimeScale = n;
      return com.greensock.TweenMax.__get__globalTimeScale();
   }
}
