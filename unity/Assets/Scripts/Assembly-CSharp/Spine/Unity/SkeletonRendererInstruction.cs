namespace Spine.Unity
{
	public class SkeletonRendererInstruction
	{
		public bool immutableTriangles;

		public readonly ExposedList<SubmeshInstruction> submeshInstructions;

		public bool hasActiveClipping;

		public int rawVertexCount;

		public readonly ExposedList<Attachment> attachments;

		public void Clear()
		{
		}

		public void Dispose()
		{
		}

		public void SetWithSubset(ExposedList<SubmeshInstruction> instructions, int startSubmesh, int endSubmesh)
		{
		}

		public void Set(SkeletonRendererInstruction other)
		{
		}

		public static bool GeometryNotEqual(SkeletonRendererInstruction a, SkeletonRendererInstruction b)
		{
			return false;
		}
	}
}
