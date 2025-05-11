namespace Spine
{
	public class SkeletonClipping
	{
		internal readonly Triangulator triangulator;

		internal readonly ExposedList<float> clippingPolygon;

		internal readonly ExposedList<float> clipOutput;

		internal readonly ExposedList<float> clippedVertices;

		internal readonly ExposedList<int> clippedTriangles;

		internal readonly ExposedList<float> clippedUVs;

		internal readonly ExposedList<float> scratch;

		internal ClippingAttachment clipAttachment;

		internal ExposedList<ExposedList<float>> clippingPolygons;

		public ExposedList<float> ClippedVertices
		{
			get
			{
				return null;
			}
		}

		public ExposedList<int> ClippedTriangles
		{
			get
			{
				return null;
			}
		}

		public ExposedList<float> ClippedUVs
		{
			get
			{
				return null;
			}
		}

		public bool IsClipping
		{
			get
			{
				return false;
			}
		}

		public int ClipStart(Slot slot, ClippingAttachment clip)
		{
			return 0;
		}

		public void ClipEnd(Slot slot)
		{
		}

		public void ClipEnd()
		{
		}

		public void ClipTriangles(float[] vertices, int verticesLength, int[] triangles, int trianglesLength, float[] uvs)
		{
		}

		internal bool Clip(float x1, float y1, float x2, float y2, float x3, float y3, ExposedList<float> clippingArea, ExposedList<float> output)
		{
			return false;
		}

		private static void MakeClockwise(ExposedList<float> polygon)
		{
		}
	}
}
