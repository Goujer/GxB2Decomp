namespace DragonBones
{
	internal class BlendState
	{
		public bool dirty;

		public int layer;

		public float leftWeight;

		public float layerWeight;

		public float blendWeight;

		public int Update(float weight, int p_layer)
		{
			return 0;
		}

		public void Clear()
		{
		}
	}
}
