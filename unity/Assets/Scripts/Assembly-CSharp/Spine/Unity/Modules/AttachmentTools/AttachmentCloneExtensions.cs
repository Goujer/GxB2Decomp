using UnityEngine;

namespace Spine.Unity.Modules.AttachmentTools
{
	public static class AttachmentCloneExtensions
	{
		public static Attachment GetClone(this Attachment o, bool cloneMeshesAsLinked)
		{
			return null;
		}

		public static RegionAttachment GetClone(this RegionAttachment o)
		{
			return null;
		}

		public static ClippingAttachment GetClone(this ClippingAttachment o)
		{
			return null;
		}

		public static PointAttachment GetClone(this PointAttachment o)
		{
			return null;
		}

		public static BoundingBoxAttachment GetClone(this BoundingBoxAttachment o)
		{
			return null;
		}

		public static MeshAttachment GetLinkedClone(this MeshAttachment o, bool inheritDeform = true)
		{
			return null;
		}

		public static MeshAttachment GetClone(this MeshAttachment o)
		{
			return null;
		}

		public static PathAttachment GetClone(this PathAttachment o)
		{
			return null;
		}

		private static void CloneVertexAttachment(VertexAttachment src, VertexAttachment dest)
		{
		}

		public static MeshAttachment GetLinkedMesh(this MeshAttachment o, string newLinkedMeshName, AtlasRegion region, bool inheritDeform = true, bool copyOriginalProperties = false)
		{
			return null;
		}

		public static MeshAttachment GetLinkedMesh(this MeshAttachment o, Sprite sprite, Shader shader, bool inheritDeform = true, Material materialPropertySource = null)
		{
			return null;
		}

		public static MeshAttachment GetLinkedMesh(this MeshAttachment o, Sprite sprite, Material materialPropertySource, bool inheritDeform = true)
		{
			return null;
		}

		public static Attachment GetRemappedClone(this Attachment o, Sprite sprite, Material sourceMaterial, bool premultiplyAlpha = true, bool cloneMeshAsLinked = true, bool useOriginalRegionSize = false)
		{
			return null;
		}

		public static Attachment GetRemappedClone(this Attachment o, AtlasRegion atlasRegion, bool cloneMeshAsLinked = true, bool useOriginalRegionSize = false, float scale = 0.01f)
		{
			return null;
		}
	}
}
