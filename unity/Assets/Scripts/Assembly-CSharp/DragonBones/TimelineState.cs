using System.Collections.Generic;

namespace DragonBones
{
	internal abstract class TimelineState : BaseObject
	{
		public int playState;

		public int currentPlayTimes;

		public float currentTime;

		protected TweenState _tweenState;

		protected uint _frameRate;

		protected int _frameValueOffset;

		protected uint _frameCount;

		protected uint _frameOffset;

		protected int _frameIndex;

		protected float _frameRateR;

		protected float _position;

		protected float _duration;

		protected float _timeScale;

		protected float _timeOffset;

		protected DragonBonesData _dragonBonesData;

		protected AnimationData _animationData;

		protected TimelineData _timelineData;

		protected Armature _armature;

		protected AnimationState _animationState;

		protected TimelineState _actionTimeline;

		protected short[] _frameArray;

		protected short[] _frameIntArray;

		protected float[] _frameFloatArray;

		protected ushort[] _timelineArray;

		protected List<uint> _frameIndices;

		protected override void _OnClear()
		{
		}

		protected abstract void _OnArriveAtFrame();

		protected abstract void _OnUpdateFrame();

		protected bool _SetCurrentTime(float passedTime)
		{
			return false;
		}

		public virtual void Init(Armature armature, AnimationState animationState, TimelineData timelineData)
		{
		}

		public virtual void FadeOut()
		{
		}

		public virtual void Update(float passedTime)
		{
		}
	}
}
