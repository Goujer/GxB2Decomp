using UnityEngine;

public class AudioManager
{
	private enum DuckingState
	{
		Start = 0,
		Extend = 1,
		Cancel = 2,
		None = 3
	}

	private GameObject AudioController;

	private static AudioManager instance;

	private AudioSource[] SFXSource;

	private int[] SFXBundleKey;

	private Transform[] PlaySFXTrans;

	private short MarkSFXBundleKey;

	private int SpeechSoundPrev;

	private float[] SpeechSoundPitchVal;

	private ClipInfo SFXClip;

	private int poolIndex;

	private int FireKey;

	private AudioSource FireSFXSource;

	private AudioHighPassFilter FireHighPass;

	private AudioCloseQueue[] CloseQueue;

	private int CloseQueueIndex;

	private AudioSource[] BGMSource;

	private int BGMLoop;

	private ClipInfo BGMClip;

	private AssetLoader[] BGMAssetLoaders;

	private int BGMmainIndex;

	private bool bCrossfade;

	private float FadeTime;

	private float FadeTimeMax;

	public float MusicVol;

	private float TmpVol;

	private string CurMusicPath;

	private float DuckVolDecrease;

	private float DuckDeltaTime;

	private int PlaySFXCount;

	public bool BlockNormalSFX;

	private DuckingState duckingstate;

	private string MP3ABName;

	private AudioSource MP3Source;

	public float BaseVol;

	private bool MuteSFXVol;

	private int[] PauseKey;

	private int CurUseIndex;

	private short bPlayOnlyOneClip;

	private AudioSourceController SourceController;

	private bool playMusic;

	private int LastVoiceIndex;

	private string LastVoiceName;

	public static AudioManager Instance
	{
		get
		{
			return null;
		}
	}

	private AudioManager()
	{
	}

	public static void Reset()
	{
	}

	private void Initial()
	{
	}

	public void SetMusicOn()
	{
	}

	public void SetSoundOn()
	{
	}

	public void LoadSFXObj()
	{
	}

	public void SetSFXEnvironment(SFXKind Kind)
	{
	}

	public string GetCurMusic()
	{
		return null;
	}

	private void UnloadBGM(int index)
	{
	}

	public void LoadAndPlayBGM(string Path, int Loop = 1, bool Force = false)
	{
	}

	private AudioClip LoadAudioClip(string Path, out AbstractLoader loader)
	{
		loader = null;
		return null;
	}

	public void LoadAudioClipAsync(string Path, ResManager.LoadDelegate callback)
	{
	}

	public void UnLoadBGM()
	{
	}

	public void PlaySFXCloseBGM(string Path, float delay = 0f, PitchKind pitchkind = PitchKind.NoPitch, Transform PlayObj = null)
	{
	}

	public void PlayVoice(string Path)
	{
	}

	public void PlaySFX(string Path, float delay = 0f, PitchKind pitchkind = PitchKind.NoPitch, Transform PlayObj = null, Vector3? Position = null)
	{
	}

	private void GetEmptyIndex()
	{
	}

	public bool PlaySFXLoop(string Path, out int Key, Transform PlayObj = null, SFXEffect Effect = SFXEffect.Normal, float delay = 0f)
	{
		Key = default(int);
		return false;
	}

	private bool PlaySFXLoopHighPass(string Path, out int Key, Transform PlayObj = null)
	{
		Key = default(int);
		return false;
	}

	private void ChangeDuckingState(DuckingState State)
	{
	}

	public void SwitchMusic(bool TurnOn)
	{
	}

	public void StopSFX(int Key, bool bFadeOut = true)
	{
	}

	public void AddCloseQueue(int Key)
	{
	}

	public void PauseSFX(int Key)
	{
	}

	public void PlaySFX(int Key)
	{
	}

	public void SetFireSize(float Size)
	{
	}

	public void PlayMP3SFX(string Path, float delay = 0f)
	{
	}

	public void StopMP3AndPlayBGM()
	{
	}

	public void Update()
	{
	}

	private void UpdateCrossfade()
	{
	}

	private float OutQuintic(float t, float b, float c, float d)
	{
		return 0f;
	}

	public void DelSFXClip(int Index)
	{
	}

	public void DelFireClip()
	{
	}

	private void UpdateDucking()
	{
	}

	private void UpdateCloseFadeOut()
	{
	}

	public void NotifyCloseSFX(int Key)
	{
	}

	private void PlayAudio(AudioSource au, ClipInfo clipInfo)
	{
	}

	public void Destroy()
	{
	}

	public void RetrieveSFX()
	{
	}

	private void AttachAudioSound(int sourceIndex, Transform transform)
	{
	}

	private void AttachAudioSound(int sourceIndex, Vector3 position)
	{
	}
}
