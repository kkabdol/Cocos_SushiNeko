<GameProjectFile>
  <PropertyGroup Type="Node" Name="Piece" ID="f89158f1-d10c-49fa-b31a-1c3a690b98e3" Version="2.3.2.3" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="96" Speed="1.0000" ActivedAnimationName="default">
        <Timeline ActionTag="1048027673" Property="Position">
          <PointFrame FrameIndex="0" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="1" X="0.0000" Y="0.0000">
            <EasingData Type="2" />
          </PointFrame>
          <PointFrame FrameIndex="48" X="800.0000" Y="200.0000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="49" X="0.0000" Y="0.0000">
            <EasingData Type="5" />
          </PointFrame>
          <PointFrame FrameIndex="96" X="-800.0000" Y="200.0000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="1048027673" Property="RotationSkew">
          <ScaleFrame FrameIndex="1" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="48" X="360.0000" Y="360.0000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="49" X="0.0000" Y="0.0000">
            <EasingData Type="5" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="96" X="-360.0000" Y="-360.0000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="1048027673" Property="VisibleForFrame">
          <BoolFrame FrameIndex="0" Tween="False" Value="True" />
        </Timeline>
      </Animation>
      <AnimationList>
        <AnimationInfo Name="default" StartIndex="0" EndIndex="0">
          <RenderColor A="150" R="255" G="228" B="181" />
        </AnimationInfo>
        <AnimationInfo Name="moveRight" StartIndex="1" EndIndex="48">
          <RenderColor A="150" R="192" G="192" B="192" />
        </AnimationInfo>
        <AnimationInfo Name="moveLeft" StartIndex="49" EndIndex="96">
          <RenderColor A="150" R="184" G="134" B="11" />
        </AnimationInfo>
      </AnimationList>
      <ObjectData Name="Node" CustomClassName="Piece" Tag="5" ctype="GameNodeObjectData">
        <Size X="0.0000" Y="0.0000" />
        <Children>
          <AbstractNodeData Name="roll" ActionTag="1048027673" Tag="6" IconVisible="False" LeftMargin="-105.0000" RightMargin="-105.0000" TopMargin="-122.5000" BottomMargin="-122.5000" ctype="SpriteObjectData">
            <Size X="210.0000" Y="245.0000" />
            <Children>
              <AbstractNodeData Name="leftChopstick" ActionTag="1538147187" VisibleForFrame="False" Tag="8" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" LeftMargin="-210.0000" RightMargin="210.0000" TopMargin="101.5000" BottomMargin="52.5000" ctype="SpriteObjectData">
                <Size X="210.0000" Y="91.0000" />
                <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                <Position Y="98.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition Y="0.4000" />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="Assets/Images/resources-2x/chopstick.png" Plist="" />
                <BlendFunc Src="770" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="rightChopstick" ActionTag="-1809213674" VisibleForFrame="False" Tag="7" IconVisible="False" HorizontalEdge="BothEdge" VerticalEdge="BothEdge" LeftMargin="210.0000" RightMargin="-210.0000" TopMargin="101.5000" BottomMargin="52.5000" FlipX="True" ctype="SpriteObjectData">
                <Size X="210.0000" Y="91.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="210.0000" Y="98.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="1.0000" Y="0.4000" />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="Assets/Images/resources-2x/chopstick.png" Plist="" />
                <BlendFunc Src="770" Dst="771" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="Assets/Images/resources-2x/roll.png" Plist="" />
            <BlendFunc Src="770" Dst="771" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameProjectFile>