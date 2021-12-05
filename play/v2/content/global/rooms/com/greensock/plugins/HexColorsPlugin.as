class com.greensock.plugins.HexColorsPlugin extends com.greensock.plugins.TweenPlugin
{
   static var API = 1;
   function HexColorsPlugin()
   {
      super();
      this.propName = "hexColors";
      this.overwriteProps = [];
      this._colors = [];
   }
   function onInitTween(target, value, tween)
   {
      for(var _loc4_ in value)
      {
         this.initColor(target,_loc4_,Number(target[_loc4_]),Number(value[_loc4_]));
      }
      return true;
   }
   function initColor(target, propName, start, end)
   {
      if(start != end)
      {
         var _loc3_ = start >> 16;
         var _loc5_ = start >> 8 & 255;
         var _loc2_ = start & 255;
         this._colors[this._colors.length] = [target,propName,_loc3_,(end >> 16) - _loc3_,_loc5_,(end >> 8 & 255) - _loc5_,_loc2_,(end & 255) - _loc2_];
         this.overwriteProps[this.overwriteProps.length] = propName;
      }
   }
   function killProps(lookup)
   {
      var _loc3_ = this._colors.length;
      while(true)
      {
         _loc3_;
         if(!_loc3_--)
         {
            break;
         }
         if(lookup[this._colors[_loc3_][1]] != undefined)
         {
            this._colors.splice(_loc3_,1);
         }
      }
      super.killProps(lookup);
   }
   function __set__changeFactor(n)
   {
      var _loc4_ = this._colors.length;
      var _loc2_ = undefined;
      while(true)
      {
         _loc4_;
         if(!_loc4_--)
         {
            break;
         }
         _loc2_ = this._colors[_loc4_];
         _loc2_[0][_loc2_[1]] = _loc2_[2] + n * _loc2_[3] << 16 | _loc2_[4] + n * _loc2_[5] << 8 | _loc2_[6] + n * _loc2_[7];
      }
      return this.__get__changeFactor();
   }
}
