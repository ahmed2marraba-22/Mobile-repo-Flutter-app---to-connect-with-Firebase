from datetime import datetime, timedelta, timezone
from uuid import uuid4
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field

router = APIRouter(prefix='/auth', tags=['auth'])

class LoginRequest(BaseModel):
    username: str = Field(min_length=1)
    password: str = Field(min_length=1)

class RefreshRequest(BaseModel):
    refresh_token: str = Field(min_length=1)

@router.post('/login')
def login(request: LoginRequest):
    # Integration contract only: production identity provider plugs in here.
    if not request.username or not request.password:
        raise HTTPException(401, 'invalid_credentials')
    now = datetime.now(timezone.utc)
    return {
        'access_token': f'access-{uuid4()}',
        'refresh_token': f'refresh-{uuid4()}',
        'expires_at': (now + timedelta(minutes=30)).isoformat(),
        'user_id': str(uuid4()),
        'display_name': request.username,
    }

@router.post('/refresh')
def refresh(request: RefreshRequest):
    if not request.refresh_token.startswith('refresh-'):
        raise HTTPException(401, 'invalid_refresh_token')
    now = datetime.now(timezone.utc)
    return {
        'access_token': f'access-{uuid4()}',
        'refresh_token': request.refresh_token,
        'expires_at': (now + timedelta(minutes=30)).isoformat(),
        'user_id': str(uuid4()),
        'display_name': 'field-user',
    }
