class com.greensock.plugins.VolumePlugin extends com.greensock.plugins.TweenPlugin
{
   static var API = 1;
   function VolumePlugin()
   {
      super();
      this.propName = "volume";
      this.overwriteProps = ["volume"];
   }
   function onInitTween(target, value, tween)
   {
      if(isNaN(value) || typeof target != "movieclip" && !(target instanceof Sound))
      {
         return false;
      }
      this._sound = typeof target != "movieclip" ? Sound(target) : new Sound(target);
      this.volume = this._sound.getVolume();
      this.addTween(this,"volume",this.volume,value,"volume");
      return true;
   }
   function __set__changeFactor(n)
   {
      this.updateTweens(n);
      this._sound.setVolume(this.volume);
      return this.__get__changeFactor();
   }
}
