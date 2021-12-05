class com.greensock.plugins.VisiblePlugin extends com.greensock.plugins.TweenPlugin
{
   static var API = 1;
   function VisiblePlugin()
   {
      super();
      this.propName = "_visible";
      this.overwriteProps = ["_visible"];
   }
   function onInitTween(target, value, tween)
   {
      this._target = target;
      this._tween = tween;
      this._initVal = Boolean(this._target._visible);
      this._visible = Boolean(value);
      return true;
   }
   function __set__changeFactor(n)
   {
      if(n == 1 && (this._tween.cachedDuration == this._tween.cachedTime || this._tween.cachedTime == 0))
      {
         this._target._visible = this._visible;
      }
      else
      {
         this._target._visible = this._initVal;
      }
      return this.__get__changeFactor();
   }
}
