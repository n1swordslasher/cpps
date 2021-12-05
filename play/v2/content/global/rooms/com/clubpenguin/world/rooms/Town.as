class com.clubpenguin.world.rooms.Town extends com.clubpenguin.world.rooms.BaseRoom
{
   static var CLASS_NAME = "Town";
   function Town(stageReference)
   {
      super(stageReference);
      trace(com.clubpenguin.world.rooms.Town.CLASS_NAME + "()");
      this._stage.start_x = 355;
      this._stage.start_y = 310;
      this.localize([this._stage.background_mc.signs_mc]);
      this.setupNavigationButtons([new com.clubpenguin.world.rooms.common.NavigationButtonVO(this._stage.background_mc.dock_btn,65,290),new com.clubpenguin.world.rooms.common.NavigationButtonVO(this._stage.background_mc.coffee_btn,215,235),new com.clubpenguin.world.rooms.common.NavigationButtonVO(this._stage.background_mc.dance_btn,425,220),new com.clubpenguin.world.rooms.common.NavigationButtonVO(this._stage.background_mc.shop_btn,545,230),new com.clubpenguin.world.rooms.common.NavigationButtonVO(this._stage.background_mc.forts_btn,700,295),new com.clubpenguin.world.rooms.common.NavigationButtonVO(this._stage.background_mc.seat01_btn,272,234),new com.clubpenguin.world.rooms.common.NavigationButtonVO(this._stage.background_mc.seat02_btn,347,232)]);
      this._stage.background_mc.dock_btn.useHandCursor = false;
      this._stage.background_mc.forts_btn.useHandCursor = false;
      this._stage.background_mc.seat01_btn.useHandCursor = false;
      this._stage.background_mc.seat02_btn.useHandCursor = false;
      this._stage.background_mc.dance_btn.onRollOver = com.clubpenguin.util.Delegate.create(this,this.danceRollOver);
      this._stage.background_mc.dance_btn.onRollOut = com.clubpenguin.util.Delegate.create(this,this.danceRollOut);
      this._stage.triggers_mc.dock_mc.triggerFunction = com.clubpenguin.util.Delegate.create(this,this.exit,"dock",635,195);
      this._stage.triggers_mc.coffee_mc.triggerFunction = com.clubpenguin.util.Delegate.create(this,this.exit,"coffee",355,200);
      this._stage.triggers_mc.dance_mc.triggerFunction = com.clubpenguin.util.Delegate.create(this,this.exit,"dance",170,270);
      this._stage.triggers_mc.shop_mc.triggerFunction = com.clubpenguin.util.Delegate.create(this,this.exit,"shop",555,210);
      this._stage.triggers_mc.forts_mc.triggerFunction = com.clubpenguin.util.Delegate.create(this,this.exit,"forts",110,260);
   }
   function danceRollOver()
   {
      this._stage.danceawning_mc.gotoAndStop(2);
      this._stage.background_mc.dancedoor_mc.gotoAndPlay(2);
   }
   function danceRollOut()
   {
      this._stage.danceawning_mc.gotoAndStop(1);
      this._stage.background_mc.dancedoor_mc.gotoAndPlay(8);
   }
   function exit(name, x, y)
   {
      trace(com.clubpenguin.world.rooms.Town.CLASS_NAME + ": exit()");
      this._SHELL.sendJoinRoom(name,x,y);
   }
   function init()
   {
      trace(com.clubpenguin.world.rooms.Town.CLASS_NAME + ": init()");
      this._destroyDelegate = com.clubpenguin.util.Delegate.create(this,this.destroy);
      this._SHELL.addListener(this._SHELL.ROOM_DESTROYED,this._destroyDelegate);
   }
   function destroy()
   {
      trace(com.clubpenguin.world.rooms.Town.CLASS_NAME + ": destroy()");
      this._SHELL.removeListener(this._SHELL.ROOM_DESTROYED,this._destroyDelegate);
   }
}
