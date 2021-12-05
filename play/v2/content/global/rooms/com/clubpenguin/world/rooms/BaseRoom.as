class com.clubpenguin.world.rooms.BaseRoom
{
   function BaseRoom(stageReference)
   {
      this._stage = stageReference;
      this._SHELL = _global.getCurrentShell();
      this._ENGINE = _global.getCurrentEngine();
      this._INTERFACE = _global.getCurrentInterface();
      this.hideRoomElements();
   }
   function hideRoomElements()
   {
      trace("hideRoomElements");
      this._stage.triggers_mc._visible = false;
      this._stage.block_mc._visible = false;
      this._stage.snowballBlock._visible = false;
   }
   function localize(globalAssets)
   {
      var _loc4_ = "en";
      if(this._SHELL.getLanguageAbbreviation() != undefined)
      {
         _loc4_ = this._SHELL.getLanguageAbbreviation();
      }
      var _loc2_ = 0;
      while(_loc2_ < globalAssets.length)
      {
         trace("globalAssets[" + _loc2_ + "]: " + globalAssets[_loc2_]);
         globalAssets[_loc2_].gotoAndStop(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setupNavigationButtons(navigationButtons)
   {
      var _loc2_ = 0;
      while(_loc2_ < navigationButtons.length)
      {
         trace("navigationButtons[" + _loc2_ + "]: " + navigationButtons[_loc2_].button);
         navigationButtons[_loc2_].button.onRelease = com.clubpenguin.util.Delegate.create(this,this.navigationButtonClick,navigationButtons,_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function navigationButtonClick(navigationButtons, whichButton)
   {
      var _loc3_ = Math.round(navigationButtons[whichButton].navigationX);
      var _loc2_ = Math.round(navigationButtons[whichButton].navigationY);
      this._ENGINE.sendPlayerMove(_loc3_,_loc2_);
      trace("setupNavigationButtons.navigationButtonClick: _ENGINE.sendPlayerMove(" + _loc3_ + ", " + _loc2_ + ")");
   }
   function showContent(content)
   {
      var _loc2_ = 0;
      while(_loc2_ < content.length)
      {
         trace("showContent.content[" + _loc2_ + "]: " + content[_loc2_].button);
         content[_loc2_].button.onRelease = com.clubpenguin.util.Delegate.create(this,this.showContentClick,content,_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function showContentClick(content, whichButton)
   {
      trace("showContent.showContentClick: ");
      if(content[whichButton].condition)
      {
         trace("\tshowing content: " + content[whichButton].content);
         this._INTERFACE.showContent(content[whichButton].content,null,null,content[whichButton].data,null);
      }
      else
      {
         trace("\tshowing elseContent: " + content[whichButton].elseContent);
         this._INTERFACE.showContent(content[whichButton].elseContent,null,null,content[whichButton].data,null);
      }
   }
   function setupHint(hints)
   {
      var _loc2_ = 0;
      while(_loc2_ < hints.length)
      {
         trace("setupHint.hints[" + _loc2_ + "].button: " + hints[_loc2_].button);
         trace("\t\t\t\t   anchor: " + hints[_loc2_].anchor);
         hints[_loc2_].button.onRollOver = com.clubpenguin.util.Delegate.create(this,this.showHint,hints,_loc2_);
         hints[_loc2_].button.onRollOut = com.clubpenguin.util.Delegate.create(this,this.closeHint,hints,_loc2_);
         hints[_loc2_].button.onReleaseOutside = com.clubpenguin.util.Delegate.create(this,this.closeHint,hints,_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function showHint(hints, whichButton)
   {
      trace("showHint: " + hints[whichButton].hint);
      this._INTERFACE.showHint(hints[whichButton].anchor,hints[whichButton].hint);
   }
   function closeHint(hints, whichButton)
   {
      trace("closeHint: " + hints[whichButton].hint);
      this._INTERFACE.closeHint(hints[whichButton].anchor,hints[whichButton].hint);
   }
   function setupTableGame(stage, tableObjects)
   {
      stage.table_list = [];
      var _loc2_ = 0;
      while(_loc2_ < tableObjects.length)
      {
         trace("setupTableGame.tableObjects[" + _loc2_ + "]: " + tableObjects[_loc2_].tableClip);
         stage.table_list.push(tableObjects[_loc2_].tableID);
         tableObjects[_loc2_].tableClip.seat_frames = tableObjects[_loc2_].seatframes;
         tableObjects[_loc2_].tableClip.game_btn.onRelease = com.clubpenguin.util.Delegate.create(this,this.clickTable,tableObjects,_loc2_);
         tableObjects[_loc2_].tableClip.game_btn.onRollOver = com.clubpenguin.util.Delegate.create(this,this.tableRollOver,tableObjects,_loc2_);
         tableObjects[_loc2_].tableClip.game_btn.onRollOut = com.clubpenguin.util.Delegate.create(this,this.tableRollOut,tableObjects,_loc2_);
         tableObjects[_loc2_].triggerClip.triggerFunction = com.clubpenguin.util.Delegate.create(this,this.tableTrigger,tableObjects,_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function clickTable(tableObjects, whichClip)
   {
      var _loc3_ = Math.round(tableObjects[whichClip].tableClip._x);
      var _loc2_ = Math.round(tableObjects[whichClip].tableClip._y);
      this._ENGINE.sendPlayerMove(_loc3_,_loc2_);
      trace("setupTableGame.clickTable: _ENGINE.sendPlayerMove(" + _loc3_ + ", " + _loc2_ + ")");
   }
   function tableRollOver(tableObjects, whichClip)
   {
      var _loc4_ = 2;
      trace("setupTableGame.tableRollOver: " + tableObjects[whichClip].tableClip);
      this._INTERFACE.showHint(tableObjects[whichClip].tableClip.game_btn,tableObjects[whichClip].hintName);
      tableObjects[whichClip].tableClip.game_mc.gotoAndStop(_loc4_);
   }
   function tableRollOut(tableObjects, whichClip)
   {
      var _loc2_ = 1;
      trace("setupTableGame.tableRollOut: " + tableObjects[whichClip].tableClip);
      this._INTERFACE.closeHint();
      tableObjects[whichClip].tableClip.game_mc.gotoAndStop(_loc2_);
   }
   function tableTrigger(tableObjects, whichClip)
   {
      trace("setupTableGame.tableTrigger: " + tableObjects[whichClip].tableClip);
      this._ENGINE.sendJoinTable(tableObjects[whichClip].gameName,tableObjects[whichClip].tableID,tableObjects[whichClip].is_prompt);
   }
}
