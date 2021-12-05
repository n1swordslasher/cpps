class com.greensock.plugins.ShortRotationPlugin extends com.greensock.plugins.TweenPlugin
{
   static var API = 1;
   function ShortRotationPlugin()
   {
      super();
      this.propName = "shortRotation";
      this.overwriteProps = [];
   }
   function onInitTween(target, value, tween)
   {
      if(typeof value == "number")
      {
         return false;
      }
      var _loc4_ = Boolean(value.useRadians == true);
      for(var _loc5_ in value)
      {
         if(_loc5_ != "useRadians")
         {
            this.initRotation(target,_loc5_,target[_loc5_],typeof value[_loc5_] != "number" ? target[_loc5_] + Number(value[_loc5_]) : Number(value[_loc5_]),_loc4_);
         }
      }
      return true;
   }
   function initRotation(target, propName, start, end, useRadians)
   {
      var _loc3_ = !useRadians ? 360 : 6.283185307179586;
      var _loc2_ = (end - start) % _loc3_;
      if(_loc2_ != _loc2_ % (_loc3_ / 2))
      {
         _loc2_ = _loc2_ >= 0 ? _loc2_ - _loc3_ : _loc2_ + _loc3_;
      }
      this.addTween(target,propName,start,start + _loc2_,propName);
      this.overwriteProps[this.overwriteProps.length] = propName;
   }
}
