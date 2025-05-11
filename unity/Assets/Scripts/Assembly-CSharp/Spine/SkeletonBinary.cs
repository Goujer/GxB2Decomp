using System.Collections.Generic;
using System.IO;

namespace Spine
{
	public class SkeletonBinary
	{
		internal class Vertices
		{
			public int[] bones;

			public float[] vertices;
		}

		public const int BONE_ROTATE = 0;

		public const int BONE_TRANSLATE = 1;

		public const int BONE_SCALE = 2;

		public const int BONE_SHEAR = 3;

		public const int SLOT_ATTACHMENT = 0;

		public const int SLOT_COLOR = 1;

		public const int SLOT_TWO_COLOR = 2;

		public const int PATH_POSITION = 0;

		public const int PATH_SPACING = 1;

		public const int PATH_MIX = 2;

		public const int CURVE_LINEAR = 0;

		public const int CURVE_STEPPED = 1;

		public const int CURVE_BEZIER = 2;

		private AttachmentLoader attachmentLoader;

		private byte[] buffer;

		private List<SkeletonJson.LinkedMesh> linkedMeshes;

		public static readonly TransformMode[] TransformModeValues;

		public float Scale { get; set; }

		public SkeletonBinary(params Atlas[] atlasArray)
		{
		}

		public SkeletonBinary(AttachmentLoader attachmentLoader)
		{
		}

		public SkeletonData ReadSkeletonData(string path)
		{
			return null;
		}

		public static string GetVersionString(Stream input)
		{
			return null;
		}

		public SkeletonData ReadSkeletonData(Stream input)
		{
			return null;
		}

		private Skin ReadSkin(Stream input, SkeletonData skeletonData, string skinName, bool nonessential)
		{
			return null;
		}

		private Attachment ReadAttachment(Stream input, SkeletonData skeletonData, Skin skin, int slotIndex, string attachmentName, bool nonessential)
		{
			return null;
		}

		private Vertices ReadVertices(Stream input, int vertexCount)
		{
			return null;
		}

		private float[] ReadFloatArray(Stream input, int n, float scale)
		{
			return null;
		}

		private int[] ReadShortArray(Stream input)
		{
			return null;
		}

		private void ReadAnimation(string name, Stream input, SkeletonData skeletonData)
		{
		}

		private void ReadCurve(Stream input, int frameIndex, CurveTimeline timeline)
		{
		}

		private static sbyte ReadSByte(Stream input)
		{
			return 0;
		}

		private static bool ReadBoolean(Stream input)
		{
			return false;
		}

		private float ReadFloat(Stream input)
		{
			return 0f;
		}

		private static int ReadInt(Stream input)
		{
			return 0;
		}

		private static int ReadVarint(Stream input, bool optimizePositive)
		{
			return 0;
		}

		private string ReadString(Stream input)
		{
			return null;
		}

		private static void ReadFully(Stream input, byte[] buffer, int offset, int length)
		{
		}
	}
}
