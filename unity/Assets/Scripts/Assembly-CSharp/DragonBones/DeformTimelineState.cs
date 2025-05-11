using System.Collections.Generic;

namespace DragonBones
{
	internal class DeformTimelineState : SlotTimelineState
	{
		public int vertexOffset;

		private bool _dirty;

		private int _frameFloatOffset;

		private int _valueCount;

		private int _deformCount;

		private int _valueOffset;

		private readonly List<float> _current;

		private readonly List<float> _delta;

		private readonly List<float> _result;

		public bool test;

		protected override void _OnClear()
		{
		}

		protected override void _OnArriveAtFrame()
		{
		}

		protected override void _OnUpdateFrame()
		{
		}

		public override void Init(Armature armature, AnimationState animationState, TimelineData timelineData)
		{
		}

		public override void FadeOut()
		{
		}

		public override void Update(float passedTime)
		{
		}
	}
}
