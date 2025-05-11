namespace Spine
{
	public class AtlasAttachmentLoader : AttachmentLoader
	{
		private Atlas[] atlasArray;

		public AtlasAttachmentLoader(params Atlas[] atlasArray)
		{
		}

		public RegionAttachment NewRegionAttachment(Skin skin, string name, string path)
		{
			return null;
		}

		public MeshAttachment NewMeshAttachment(Skin skin, string name, string path)
		{
			return null;
		}

		public BoundingBoxAttachment NewBoundingBoxAttachment(Skin skin, string name)
		{
			return null;
		}

		public PathAttachment NewPathAttachment(Skin skin, string name)
		{
			return null;
		}

		public PointAttachment NewPointAttachment(Skin skin, string name)
		{
			return null;
		}

		public ClippingAttachment NewClippingAttachment(Skin skin, string name)
		{
			return null;
		}

		public AtlasRegion FindRegion(string name)
		{
			return null;
		}
	}
}
