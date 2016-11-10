<GameProjectFile>
  <PropertyGroup Type="Scene" Name="MainScene" ID="a2ee0952-26b5-49ae-8bf9-4f1d6279b798" Version="2.3.2.3" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="90" Speed="1.0000" ActivedAnimationName="ready">
        <Timeline ActionTag="-349474558" Property="VisibleForFrame">
          <BoolFrame FrameIndex="1" Tween="False" Value="False" />
        </Timeline>
        <Timeline ActionTag="-1579433515" Property="VisibleForFrame">
          <BoolFrame FrameIndex="1" Tween="False" Value="False" />
          <BoolFrame FrameIndex="61" Tween="False" Value="True" />
        </Timeline>
        <Timeline ActionTag="652936263" Property="Position">
          <PointFrame FrameIndex="1" X="320.0000" Y="1344.0000">
            <EasingData Type="5" />
          </PointFrame>
          <PointFrame FrameIndex="50" X="320.0000" Y="767.9999">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="652936263" Property="VisibleForFrame">
          <BoolFrame FrameIndex="1" Tween="False" Value="True" />
          <BoolFrame FrameIndex="61" Tween="False" Value="False" />
        </Timeline>
        <Timeline ActionTag="2122761260" Property="Position">
          <PointFrame FrameIndex="61" X="64.0000" Y="84.0000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="90" X="0.0000" Y="84.0000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="2122761260" Property="VisibleForFrame">
          <BoolFrame FrameIndex="1" Tween="False" Value="False" />
          <BoolFrame FrameIndex="61" Tween="False" Value="True" />
        </Timeline>
        <Timeline ActionTag="1814044636" Property="Position">
          <PointFrame FrameIndex="61" X="576.0000" Y="84.0000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="90" X="640.0000" Y="84.0000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="1814044636" Property="VisibleForFrame">
          <BoolFrame FrameIndex="1" Tween="False" Value="False" />
          <BoolFrame FrameIndex="61" Tween="False" Value="True" />
        </Timeline>
      </Animation>
      <AnimationList>
        <AnimationInfo Name="title" StartIndex="1" EndIndex="55">
          <RenderColor A="150" R="25" G="25" B="112" />
        </AnimationInfo>
        <AnimationInfo Name="ready" StartIndex="61" EndIndex="120">
          <RenderColor A="150" R="0" G="255" B="127" />
        </AnimationInfo>
      </AnimationList>
      <ObjectData Name="Scene" ctype="GameNodeObjectData">
        <Size X="640.0000" Y="960.0000" />
        <Children>
          <AbstractNodeData Name="background_1" ActionTag="-1046096749" Tag="9" IconVisible="False" HorizontalEdge="BothEdge" LeftMargin="-64.0000" RightMargin="-64.0000" TopMargin="-176.0000" ctype="SpriteObjectData">
            <Size X="768.0000" Y="1136.0000" />
            <AnchorPoint ScaleX="0.5000" />
            <Position X="320.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="Assets/Images/resources-2x/background.png" Plist="" />
            <BlendFunc Src="770" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="character" ActionTag="255778988" Tag="10" IconVisible="True" HorizontalEdge="BothEdge" LeftMargin="320.0000" RightMargin="320.0000" TopMargin="730.0000" BottomMargin="230.0000" InnerActionSpeed="1.0000" ctype="ProjectNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="320.0000" Y="230.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.2396" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="Character.csd" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="ProjectNode_2" ActionTag="672168814" Tag="13" IconVisible="True" HorizontalEdge="BothEdge" LeftMargin="320.0000" RightMargin="320.0000" TopMargin="668.0000" BottomMargin="292.0000" InnerActionSpeed="1.0000" ctype="ProjectNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="320.0000" Y="292.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.3042" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="Piece.csd" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="pieceNode" ActionTag="-1905022651" Tag="18" IconVisible="True" HorizontalEdge="BothEdge" LeftMargin="320.0000" RightMargin="320.0000" TopMargin="554.0000" BottomMargin="406.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="320.0000" Y="406.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.4229" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="scoreLabel" ActionTag="-349474558" VisibleForFrame="False" Tag="25" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" LeftMargin="268.0000" RightMargin="268.0000" TopMargin="372.5001" BottomMargin="564.4999" FontSize="100" LabelText="0&#xA;" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
            <Size X="54.0000" Y="115.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="320.0000" Y="576.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.6000" />
            <PreSize X="0.1625" Y="0.0240" />
            <FontResource Type="Normal" Path="Assets/Fonts/Game of Three.ttf" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="play" ActionTag="-1609621964" VisibleForFrame="False" Tag="26" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" LeftMargin="218.5000" RightMargin="218.5000" TopMargin="417.0000" BottomMargin="417.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="173" Scale9Height="104" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="203.0000" Y="126.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="320.0000" Y="480.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5000" />
            <PreSize X="0.3172" Y="0.1312" />
            <TextColor A="255" R="65" G="65" B="70" />
            <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
            <PressedFileData Type="Normal" Path="Assets/Images/resources-2x/buttonPressed.png" Plist="" />
            <NormalFileData Type="Normal" Path="Assets/Images/resources-2x/button.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="lifeBG" ActionTag="-1579433515" Tag="27" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" LeftMargin="166.5000" RightMargin="166.5000" TopMargin="19.2000" BottomMargin="858.8000" ctype="SpriteObjectData">
            <Size X="307.0000" Y="82.0000" />
            <Children>
              <AbstractNodeData Name="lifeBar" ActionTag="-1047496281" Tag="28" IconVisible="False" VerticalEdge="BothEdge" LeftMargin="17.0000" RightMargin="351.0000" TopMargin="455.5000" BottomMargin="455.5000" ctype="SpriteObjectData">
                <Size X="272.0000" Y="49.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="17.0000" Y="41.0000" />
                <Scale ScaleX="0.5000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0266" Y="0.5000" />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="Assets/Images/resources-2x/life.png" Plist="" />
                <BlendFunc Src="770" Dst="771" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
            <Position X="320.0000" Y="940.8000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.9800" />
            <PreSize X="0.4797" Y="0.0854" />
            <FileData Type="Normal" Path="Assets/Images/resources-2x/life_bg.png" Plist="" />
            <BlendFunc Src="770" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="title" ActionTag="652936263" VisibleForFrame="False" Tag="26" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" LeftMargin="88.5000" RightMargin="88.5000" TopMargin="192.0001" BottomMargin="478.9999" ctype="SpriteObjectData">
            <Size X="463.0000" Y="289.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
            <Position X="320.0000" Y="767.9999" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.8000" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="Assets/Images/resources-2x/title.png" Plist="" />
            <BlendFunc Src="770" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="tapLeft" ActionTag="2122761260" Tag="27" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" RightMargin="451.0000" TopMargin="837.5000" BottomMargin="45.5000" ctype="SpriteObjectData">
            <Size X="189.0000" Y="77.0000" />
            <AnchorPoint ScaleY="0.5000" />
            <Position Y="84.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition Y="0.0875" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="Assets/Images/resources-2x/tap_left.png" Plist="" />
            <BlendFunc Src="770" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="tapRight" ActionTag="1814044636" Tag="28" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" LeftMargin="451.0000" TopMargin="837.5000" BottomMargin="45.5000" ctype="SpriteObjectData">
            <Size X="189.0000" Y="77.0000" />
            <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
            <Position X="640.0000" Y="84.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="1.0000" Y="0.0875" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="Assets/Images/resources-2x/tap_right.png" Plist="" />
            <BlendFunc Src="770" Dst="771" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameProjectFile>