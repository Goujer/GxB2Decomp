namespace Spine
{
	public class DeformTimeline : CurveTimeline
	{
		internal int slotIndex;

		internal float[] frames;

		internal float[][] frameVertices;

		internal VertexAttachment attachment;

		public int SlotIndex
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public float[] Frames
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public float[][] Vertices
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public VertexAttachment Attachment
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public override int PropertyId
		{
			get
			{
				return 0;
			}
		}

		public DeformTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float[] vertices)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
