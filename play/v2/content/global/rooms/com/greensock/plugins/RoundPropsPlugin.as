class com.greensock.plugins.RoundPropsPlugin extends com.greensock.plugins.TweenPlugin
{
   static var API = 1;
   function RoundPropsPlugin()
   {
      super();
      this.propName = "roundProps";
      this.overwriteProps = ["roundProps"];
      this.round = true;
      this.priority = -1;
      this.onInitAllProps = this._initAllProps;
   }
   function onInitTween(target, value, tween)
   {
      this._tween = tween;
      var _loc2_ = value;
      this.overwriteProps = this.overwriteProps.concat(_loc2_);
      return true;
   }
   function _initAllProps()
   {
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc6_ = this._tween.vars.roundProps;
      var _loc2_ = undefined;
      var _loc5_ = _loc6_.length;
      while((_loc5_ = _loc5_ - 1) > -1)
      {
         _loc3_ = _loc6_[_loc5_];
         _loc2_ = this._tween.cachedPT1;
         while(_loc2_)
         {
            if(_loc2_.name == _loc3_)
            {
               if(_loc2_.isPlugin)
               {
                  _loc2_.target.round = true;
               }
               else
               {
                  this.add(_loc2_.target,_loc3_,_loc2_.start,_loc2_.change);
                  this._removePropTween(_loc2_);
                  this._tween.propTweenLookup[_loc3_] = this._tween.propTweenLookup.roundProps;
               }
            }
            else if(_loc2_.isPlugin && _loc2_.name == "_MULTIPLE_" && !_loc2_.target.round)
            {
               _loc4_ = " " + _loc2_.target.overwriteProps.join(" ") + " ";
               if(_loc4_.indexOf(" " + _loc3_ + " ") != -1)
               {
                  _loc2_.target.round = true;
               }
            }
            _loc2_ = _loc2_.nextNode;
         }
      }
   }
   function _removePropTween(propTween)
   {
      if(propTween.nextNode)
      {
         propTween.nextNode.prevNode = propTween.prevNode;
      }
      if(propTween.prevNode)
      {
         propTween.prevNode.nextNode = propTween.nextNode;
      }
      else if(this._tween.cachedPT1 == propTween)
      {
         this._tween.cachedPT1 = propTween.nextNode;
      }
      if(propTween.isPlugin && propTween.target.onDisable)
      {
         propTween.target.onDisable();
      }
   }
   function add(object, propName, start, change)
   {
      this.addTween(object,propName,start,start + change,propName);
      this.overwriteProps[this.overwriteProps.length] = propName;
   }
}
