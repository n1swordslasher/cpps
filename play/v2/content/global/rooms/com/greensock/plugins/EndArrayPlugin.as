class com.greensock.plugins.EndArrayPlugin extends com.greensock.plugins.TweenPlugin
{
   static var API = 1;
   function EndArrayPlugin()
   {
      super();
      this.propName = "endArray";
      this.overwriteProps = ["endArray"];
      this._info = [];
   }
   function onInitTween(target, value, tween)
   {
      if(!(target instanceof Array) || !(value instanceof Array))
      {
         return false;
      }
      this.init([target][0],[value][0]);
      return true;
   }
   function init(start, end)
   {
      this._a = start;
      var _loc2_ = end.length;
      while(true)
      {
         _loc2_;
         if(!_loc2_--)
         {
            break;
         }
         if(start[_loc2_] != end[_loc2_] && start[_loc2_] != undefined)
         {
            this._info[this._info.length] = new com.greensock.plugins.helpers.ArrayTweenInfo(_loc2_,this._a[_loc2_],end[_loc2_] - this._a[_loc2_]);
         }
      }
   }
   function __set__changeFactor(n)
   {
      var _loc3_ = this._info.length;
      var _loc2_ = undefined;
      if(this.round)
      {
         while(true)
         {
            _loc3_;
            if(!_loc3_--)
            {
               break;
            }
            _loc2_ = this._info[_loc3_];
            this._a[_loc2_.index] = Math.round(_loc2_.start + _loc2_.change * n);
         }
      }
      else
      {
         while(true)
         {
            _loc3_;
            if(!_loc3_--)
            {
               break;
            }
            _loc2_ = this._info[_loc3_];
            this._a[_loc2_.index] = _loc2_.start + _loc2_.change * n;
         }
      }
      return this.__get__changeFactor();
   }
}
