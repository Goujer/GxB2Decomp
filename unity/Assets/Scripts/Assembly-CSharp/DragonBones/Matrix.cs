using System.Collections.Generic;

namespace DragonBones
{
	public class Matrix
	{
		public float a;

		public float b;

		public float c;

		public float d;

		public float tx;

		public float ty;

		public override string ToString()
		{
			return null;
		}

		public Matrix CopyFrom(Matrix value)
		{
			return null;
		}

		public Matrix CopyFromArray(List<float> value, int offset = 0)
		{
			return null;
		}

		public Matrix Identity()
		{
			return null;
		}

		public Matrix Concat(Matrix value)
		{
			return null;
		}

		public Matrix Invert()
		{
			return null;
		}

		public void TransformPoint(float x, float y, Point result, bool delta = false)
		{
		}

		public void TransformRectangle(Rectangle rectangle, bool delta = false)
		{
		}
	}
}
