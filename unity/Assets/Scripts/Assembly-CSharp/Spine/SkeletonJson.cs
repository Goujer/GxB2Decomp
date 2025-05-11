using System.Collections.Generic;
using System.IO;

namespace Spine
{
	public class SkeletonJson
	{
		internal class LinkedMesh
		{
			internal string parent;

			internal string skin;

			internal int slotIndex;

			internal MeshAttachment mesh;

			public LinkedMesh(MeshAttachment mesh, string skin, int slotIndex, string parent)
			{
			}
		}

		private AttachmentLoader attachmentLoader;

		private List<LinkedMesh> linkedMeshes;

		public float Scale { get; set; }

		public SkeletonJson(params Atlas[] atlasArray)
		{
		}

		public SkeletonJson(AttachmentLoader attachmentLoader)
		{
		}

		public SkeletonData ReadSkeletonData(string path)
		{
			return null;
		}

		public SkeletonData ReadSkeletonData(TextReader reader)
		{
			return null;
		}

		private Attachment ReadAttachment(Dictionary<string, object> map, Skin skin, int slotIndex, string name, SkeletonData skeletonData)
		{
			return null;
		}

		private void ReadVertices(Dictionary<string, object> map, VertexAttachment attachment, int verticesLength)
		{
		}

		private void ReadAnimation(Dictionary<string, object> map, string name, SkeletonData skeletonData)
		{
		}

		private static void ReadCurve(Dictionary<string, object> valueMap, CurveTimeline timeline, int frameIndex)
		{
		}

		private static float[] GetFloatArray(Dictionary<string, object> map, string name, float scale)
		{
			return null;
		}

		private static int[] GetIntArray(Dictionary<string, object> map, string name)
		{
			return null;
		}

		private static float GetFloat(Dictionary<string, object> map, string name, float defaultValue)
		{
			return 0f;
		}

		private static int GetInt(Dictionary<string, object> map, string name, int defaultValue)
		{
			return 0;
		}

		private static bool GetBoolean(Dictionary<string, object> map, string name, bool defaultValue)
		{
			return false;
		}

		private static string GetString(Dictionary<string, object> map, string name, string defaultValue)
		{
			return null;
		}

		private static float ToColor(string hexString, int colorIndex, int expectedLength = 8)
		{
			return 0f;
		}
	}
}
